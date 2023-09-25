class Admin::CvsController < Admin::ApplicationController
  before_action :set_admin_cv, only: %i[show edit update destroy change_status]

  # GET /admin/cvs or /admin/cvs.json
  def index
    @admin_cvs = Cv.filter(filter_params).select(:id, :status, :expected_salary, :job_id, :email, :candidate_name,
                                                 :onboarding_time, :created_at, :from_leader, :file_file_name)
  end

  def destroy
    admin_cv = Job.find_by(id: params[:job_id]).cvs.find_by(id: params[:id])
    admin_cv.destroy
  end

  def change_status
    @admin_cv.update(
      status: change_status_params[:status].to_i,
      candidate_name: change_status_params[:candidate_name]
    )
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_cv
    @admin_cv = Cv.find_by(id: params[:id] || change_status_params[:id])
  end

  def filter_params
    params.permit(:sync_from_partner, :job_id, :status)
  end

  def change_status_params
    params.require(:cvs).permit(:id, :status, :candidate_name)
  end
end
