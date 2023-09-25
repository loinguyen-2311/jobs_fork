module HrFreelancers
  class CreateUserForm
    include ActiveModel::Validations

    attr_reader :params, :user

    validate :email
    validate :password

    def initialize(params)
      @params = params
      @user = User.hr_freelancer.new(params)
    end

    def submit
      return false if invalid?

      user.password = Digest::MD5.hexdigest(params[:password])

      if user.save
        begin
          ModelMailer.email_verification(user).deliver_now
          HrFreelancerMailer.notify_new_hr_freelancer.deliver_now
        rescue StandardError => e
          Sentry.capture_exception(e)
        end
        user
      else
        errors.add(:base, user.errors.full_messages)
        false
      end
    end

    private

    def email
      if user.email.blank?
        errors.add(:email, 'can NOT be blank!')
        false
      end
    end

    def password
      if user.password.blank?
        errors.add(:password, 'can NOT be blank!')
        false
      end
    end
  end
end
