class HrFreelancersController < HrFreelancers::ApplicationController
  layout 'hr_freelancers'
  before_action :set_current_user
  def index
    return redirect_to '/hr_freelancers/sessions/signin' unless @current_hr_user.present?

    if params[:job] == 'applied_jobs'
      @current_route = 'applied_jobs'
      @freelancer_jobs = Job.joins(:cvs).where("cvs.created_by_id = #{@current_hr_user.id}")
    else
      @current_route = 'home'
      @freelancer_jobs = Job.active_job_from_dtalent
    end
  end

  def show
    @job = Job.find_by(id: params[:id])
  end

  def new; end

  def edit; end

  def create
    job = Job.find_by(id: params[:hr_freelancers][:job_id])
    job.cvs.create!(apply_job_params.merge(created_by_id: @current_hr_user.id))
    EmailMarketing.find_or_create_by(email: apply_job_params[:email])
    begin
      JobMailer.notify_candidate_apply_job(job).deliver_now if Rails.env == 'production'
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
    flash[:applied] = 'Applied successfully'
    redirect_to '/hr_freelancers?job=applied_jobs'
  end

  def update; end

  def destroy; end

  private

  def set_current_user
    return nil unless session[:hr_freelancer_token].present?

    @current_hr_user = User.find_by(access_token: session[:hr_freelancer_token])
  end

  def apply_job_params
    params.require(:hr_freelancers).permit(
      :file,
      :email,
      :expected_salary,
      :onboarding_time,
      :candidate_name
    )
  end
end
