# User Service
class UserService
  def initialize(user_id)
    @user_id = user_id
  end

  def delete_user
    user.destroy if user.present?
  end

  def block_and_unblock
    user.update_attributes(blocked: !user.blocked) if user.present?
  end

  private

  def user
    User.find_by_id(@user_id)
  end
end
