# Register Mailer
class RegisterMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    @reset_password_link = user.reset_password_link
    mail to: @user.email, subject: 'Hướng Dẫn Người Dùng Đặt Lại Mật Khẩu.'
  end

  def password_updated(user)
    @user = user
    mail to: @user.email, subject: '[CẬP NHẬT MẬT KHẨU] - Mật khẩu đã được cập nhật.'
  end
end
