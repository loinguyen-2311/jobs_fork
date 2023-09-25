class Telegram::PostCongratulationService
  def self.send_to_group(message, group_id)
    HTTParty.post(ENV['TELEGRAM_SEND_MESSAGE'], body: { chat_id: group_id, text: message }.to_json,
                                                headers: { 'content-type' => 'application/json' }).parsed_response
  end
end
