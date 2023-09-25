module HrFreelancers
  class SessionsController < ApplicationController
    layout 'hr_freelancers_session'

    def create_user
      user = HrFreelancers::CreateUserForm.new(hr_freelancer_params)
      flash[:created_hr_freelancer] = user.submit ? 'Created hr freelancer successfully, plz check email to confirm' : 'Create fail'
      redirect_to :back
    end

    def signin
      user = HrFreelancers::SignInUserForm.new(hr_freelancer_params).submit
      if user
        user.update(access_token: (session[:hr_freelancer_token] = SecureRandom.urlsafe_base64(nil, false)))
        flash[:sign_in_user] = 'Login successfully'
        return redirect_to '/hr_freelancers'
      end
      flash[:sign_in_user] = 'Login Fail'
      redirect_to :back
    end

    def hr_freelancers_email_verification
      user = User.find_by(confirm_token: params[:confirm_token])
      return redirect_to '/' if user.nil?

      user.update(activated: 1, email_confirmed: true, confirm_token: nil)
      begin
        ModelMailer.wellcome_email(user).deliver_now
      rescue StandardError => e
        Sentry.capture_exception(e)
      end
      redirect_to '/'
    end

    def forgot_password
      user = HrFreelancers::ForgotPasswordForm.new(hr_freelancer_params)
      if user.submit
        flash[:forgot_password_success] = 'Your password has been reset successfully'
        redirect_to :back
      else
        flash[:can_not_find_user] = 'Can not find user with this email'
        redirect_to :back
      end
    end

    def update_password
      user = User.find_by(password_reset_token: params[:token])
      unless user.present?
        flash[:password_reset_token_invalid] = 'Password reset Token Invalid'
        redirect_to :back
        return
      end
      user.update(password: Digest::MD5.hexdigest(hr_freelancer_params[:password]))
      begin
        RegisterMailer.password_updated(user).deliver_now
      rescue StandardError => e
        Sentry.capture_exception(e)
      end
      flash[:update_password_success] = 'Your password has been updated successfully'
      redirect_to '/hr_freelancers/sessions/signin'
    end

    def logout
      session[:hr_freelancer_token] = nil
      redirect_to '/hr_freelancers/sessions/signin'
    end

    private

    def hr_freelancer_params
      params.require(:hr_freelancer).permit(:email, :password)
    end
  end
end
