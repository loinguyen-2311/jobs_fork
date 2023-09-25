class EmailVerifyService
  def initialize(email, mode) # mode = quick || power
    @email = email
    @mode = mode
  end

  def valid
    return true if ['false', false, nil].include?(ENV['VALIDATE_EMAIL']) # bypass email validation service

    begin
      response = HTTParty.get("https://emailverifier.reoon.com/api/v1/verify?email=#{@email}&key=#{api_key}&mode=#{@mode}").parsed_response
      return ::Sentry.capture_message("SENDING EMAIL BY EMAIL VERIFY: #{response[:status]}") if response['status'] == 'error'

      response['status'] == 'safe'
    rescue StandardError => e
      Sentry.capture_exception(e)
    end
  end

  def message(english)
    valid ? valid_message(english) : invalid_message(english)
  end

  private

  def invalid_message(english)
    english ? 'This email does not exist, please check again!' : 'Email này không tồn tại, vui lòng kiểm tra lại!'
  end

  def valid_message(english)
    english ? 'This is valid email' : 'Email hợp lệ'
  end

  def api_key
    ENV['EMAIL_VERIFIER_TOKEN'] || 'wgMe8JJJzLaEY4yt2l8SVf7iqxcENqyv' # https://emailverifier.reoon.com/api-settings/
  end
end

# quick mode: https://emailverifier.reoon.com/api/v1/verify?email=<email>&key=<key>&mode=quick
# power mode: https://emailverifier.reoon.com/api/v1/verify?email=<email>&key=<key>&mode=power
