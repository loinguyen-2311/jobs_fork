# Adminlogin Controller
class Admin::SessionsController < Admin::ApplicationController
  layout 'admin_sessions'
  def index; end

  def login
    user = User.find_by(email: params[:adminlogin][:email_admin])
    if user.present? && user.user_type == 'consultant' && (user.password == Digest::MD5.hexdigest(params[:adminlogin][:password_admin]))
      token = SecureRandom.urlsafe_base64(nil, false)
      session[:consultant_token] = token
      user.update(access_token: token)
      redirect_to '/consultants'
      return
    end
    admin = User.find_by(email: 'admin@devfinding.com')
    admin_password = params[:adminlogin][:password_admin]
    if admin?(admin, admin_password)
      admin_token = SecureRandom.urlsafe_base64(nil, false)
      admin.update(access_token: admin_token)
      session[:token] = admin_token
      redirect_to '/admin/users'
    else
      flash[:admin_login_fail] = 'Your email or password is wrong'
      redirect_to :back
    end
  end

  def admin?(admin, admin_password)
    email_admin = params[:adminlogin][:email_admin] == admin.email
    password = Digest::MD5.hexdigest(admin_password) == admin.password
    email_admin && password
  end

  def logout
    session[:token] = nil
    redirect_to '/admin'
  end
end
