class Github::GetUserService
  PUBLIC_USER_API = 'https://api.github.com/users'

  def self.call(_since = 0)
    response = HTTParty.get(PUBLIC_USER_API)
    JSON.parse(response.body)
  end
end

# Get username github, from username get email and job title after send email to marketing
