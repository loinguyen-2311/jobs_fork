class Admin::UsersController < Admin::ApplicationController
  before_action :set_users, only: %i[show edit update destroy]
  # skip_before_action :verify_authenticity_token

  # GET /admin/users
  def index
    @users = User.filter(filter_params).select(
      :id,
      :email,
      :blocked,
      :created_at,
      :facebook_link,
      :email_confirmed
    ).order(created_at: :desc)
  end

  # GET /admin/users/1
  def show; end

  # GET /admin/users/new
  def new
    @admin_user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    # @admin_user = User.find_by(id: params[:id])
  end

  # POST /admin/users
  def create
    user = User.create(admin_user_params)
    user.update(user_type: 3)
    redirect_to '/admin/users'
  end

  # PATCH/PUT /admin/users/1
  def update
    @admin_user.update(admin_user_params)
    redirect_to '/admin/users'
  end

  # DELETE /admin/users/1
  def destroy
    @admin_user = User.find_by_id(params[:id])
    @admin_user.destroy!
  end

  def block_and_unblock
    @user_service = UserService.new(params[:userId])
    @user_service.block_and_unblock
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_users
    @admin_user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def admin_user_params
    params.require(:user).permit(
      :email,
      :password,
      :facebook_link
    )
  end

  def filter_params
    params.permit(:user_type)
  end
end
