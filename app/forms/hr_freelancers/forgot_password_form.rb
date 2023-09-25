module HrFreelancers
  class ForgotPasswordForm
    include ActiveModel::Validations

    attr_reader :params, :user

    validate :email

    def initialize(params)
      @params = params
      @user = User.hr_freelancer.find_by(email: params[:email])
    end

    def submit
      return false if invalid?

      if user.present?
        user.forgot_password
        return true
      end

      false
    end

    private

    def email
      if user&.email&.blank?
        errors.add(:email, 'can NOT be blank!')
        false
      end
    end
  end
end
