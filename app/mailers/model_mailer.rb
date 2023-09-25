# ModelMailer
class ModelMailer < ApplicationMailer
  def email_verification(user)
    @user = user
    @verification_url = "#{Rails.env == 'production' ? 'https://devfinding.com' : 'http://localhost:3000'}/hr_freelancers_email_verification/#{user.confirm_token}"
    mail to: @user.email, subject: 'Xác nhận email từ DevFinding Exchange!'
  end

  def wellcome_email(user)
    @user = user
    mail to: @user.email, subject: 'Chào mừng đến với hệ thống DevFinding!'
  end

  def job_marketing_email(email)
    mail to: email, subject: 'Jobs From DevFinding Platform'
  end

end
