class Admin::JobsController < Admin::ApplicationController
  before_action :set_admin_job, only: %i[show edit update destroy approve_job]

  def index
    @jobs = Job.filter(filter_job_params).select(
      :id, :title, :status, :sync_from_partner, :min_salary, :max_salary, :commission
    )
    @cv_group_by_job_ids = Cv.select(:id, :job_id).group(:job_id).size
  end

  def show; end

  def new
    @admin_job = Admin::Job.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy
    @admin_job.destroy
  end

  def approve_job
    @admin_job.going!
  end

  private

  def set_admin_job
    @admin_job = Job.find(params[:id])
  end

  def admin_job_params
    params.fetch(:admin_job, {})
  end

  def filter_job_params
    params.permit(
      :status,
      :keyword,
      :have_cv,
      :sync_from_partner
    )
  end
end
