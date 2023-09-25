# AdminMailer
class AdminMailer < ApplicationMailer
  ADMIN_EMAIL = 'nguyenvanhuan243@gmail.com'
  def password_reset(admin)
    @admin = admin
    mail to: @admin.email, subject: 'Xác nhận đặt lại mật khẩu.'
  end

  def notify_user_delete_account(feedback)
    @feedback = feedback
    mail to: ADMIN_EMAIL, subject: 'Người dùng xóa tại khoản.'
  end
end
