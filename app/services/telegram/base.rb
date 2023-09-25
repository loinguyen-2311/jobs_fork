class Telegram::Base
  def initialize
    @telegram_api = ENV['TELEGRAM_API_URL'] || 'https://api.telegram.org'
  end

  def send_message(message, telegram_token, channel, use_parse_mode = false)
    url = "#{@telegram_api}/bot#{telegram_token}/sendMessage"
    body = {
      text: message,
      chat_id: channel
    }
    body.merge!({ parse_mode: 'MarkdownV2' }) if use_parse_mode
    begin
      HTTParty.post(url, body: body.to_json, headers: headers).parsed_response
    rescue StandardError => e
      {}
    end
  end

  private

  def headers
    {
      "Content-Type": 'application/json'
    }
  end
end
