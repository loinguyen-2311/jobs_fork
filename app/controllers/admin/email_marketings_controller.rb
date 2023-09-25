class Admin::EmailMarketingsController < Admin::ApplicationController
  before_action :set_admin_email_marketing, only: %i[show edit update destroy]

  # GET /admin/email_marketings or /admin/email_marketings.json
  def index
    @admin_email_marketings = EmailMarketing.all.order(created_at: :desc)
  end

  # GET /admin/email_marketings/1 or /admin/email_marketings/1.json
  def show; end

  # GET /admin/email_marketings/new
  def new
    @admin_email_marketing = EmailMarketing.new
  end

  # GET /admin/email_marketings/1/edit
  def edit; end

  # POST /admin/email_marketings or /admin/email_marketings.json
  def create
    email_marketing = EmailMarketing.new(email_marketing_params)
    if email_marketing.save
      flash[:success] = 'Successfully created...'
    else
      flash[:fail] = email_marketing.errors.messages
    end
    redirect_to :back
  end

  # PATCH/PUT /admin/email_marketings/1 or /admin/email_marketings/1.json
  def update
    respond_to do |format|
      if @admin_email_marketing.update(admin_email_marketing_params)
        format.html do
          redirect_to admin_email_marketing_url(@admin_email_marketing),
                      notice: 'Email marketing was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @admin_email_marketing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_email_marketing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/email_marketings/1 or /admin/email_marketings/1.json
  def destroy
    @admin_email_marketing.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_email_marketing
    @admin_email_marketing = EmailMarketing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_email_marketing_params
    params.fetch(:admin_email_marketing, {})
  end

  def email_marketing_params
    params.require(:email_marketing).permit(
      :email,
      :phone_number,
      :job_title
    )
  end
end
