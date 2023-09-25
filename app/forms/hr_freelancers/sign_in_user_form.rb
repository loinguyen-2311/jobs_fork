module HrFreelancers
  class SignInUserForm
    include ActiveModel::Validations

    attr_reader :params, :user

    validate :email
    validate :password

    def initialize(params)
      @params = params
      @user = User.hr_freelancer.find_by(email: params[:email])
    end

    def submit
      return false if invalid?

      unless user.email_confirmed
        begin
          ModelMailer.email_verification(user).deliver_now
        rescue StandardError => e
          Sentry.capture_exception(e)
        end
        return false
      end

      return user if user.password == Digest::MD5.hexdigest(params[:password])

      false
    end

    private

    def email
      if user&.email&.blank?
        errors.add(:email, 'can NOT be blank!')
        false
      end
    end

    def password
      if user&.password&.blank?
        errors.add(:password, 'can NOT be blank!')
        false
      end
    end
  end
end
