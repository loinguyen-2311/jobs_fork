class Github::ImportUsersService
  def self.call
    since = GithubEmailMarketing.maximum(:last_since_number) || 0
    response = HTTParty.get("https://api.github.com/users?since=#{since}", headers: { 'Authorization' => get_token })
    response = JSON.parse(response.body)
    begin
      response.each do |item|
        username = item['login']
        email = get_email_by_username(username)
        next unless email

        GithubEmailMarketing.create(
          username: item['login'],
          email: email,
          job_title: item['name'] || 'Developer',
          last_since_number: item['id']
        )
      end
    rescue StandardError => e
      puts "exception #{e}"
    end
  end

  def self.get_email_by_username(username)
    user_email = HTTParty.get("https://api.github.com/users/#{username}",
                              headers: { 'Authorization' => get_token }).parsed_response
    return user_email['email'] if user_email['email'].present?

    user_info = HTTParty.get("https://api.github.com/users/#{username}/events/public",
                             headers: { 'Authorization' => get_token }).parsed_response
    user_info.each do |item|
      item_email = item['payload']['commits']&.first
      if item_email.present?
        return item_email['author']['email']
      end
    end
  end

  def self.get_token
    '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' || ENV['GITHUB_TOKEN']
  end
end
