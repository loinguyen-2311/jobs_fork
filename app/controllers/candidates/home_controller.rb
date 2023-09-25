module Candidates
  class HomeController < ApplicationController
    layout 'candidates'
    def index
      @tag_list = Job.tag_list
      @jobs = Job.feature_jobs
      @job_count = Job.jobs_count_number
    end

    def single_job
      @job = Job.find_by(id: params[:id])
    end

    def hr_freelancers_job
      @job = Job.find_by(id: params[:id])
    end

    def job_list
      @tag_list = Job.tag_list
      @location_list = Job.job_locations
      @job_list = Job.filter(job_filter).active_job_from_dtalent.order(created_at: :desc)
      @job_list = @job_list.paginate(page: params[:page], per_page: 5)
    end

    def remote_jobs
      @job_count = 560
      @job_list = Job.lua_ga
    end

    def hr_freelancer_jobs
      @tag_list = Job.tag_list
      @location_list = Job.job_locations
      @commission = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      @job_list = Job.filter(job_filter).active_job_from_dtalent.order(created_at: :desc)
      @job_list = @job_list.paginate(page: params[:page], per_page: 5)
    end

    def apply_job
      job = Job.find_by(id: params[:candidate][:job_id])
      # if apply_job_params[:from_leader].present? && apply_job_params[:from_leader] == 'chu_anh'
      #   begin
      #     HrFreelancerMailer.send_email_for_leader('anhhuan38hl@gmail.com').deliver_now
      #   rescue StandardError => e
      #     Sentry.capture_exception(e)
      #   end
      # end
      begin
        job.cvs.create!(apply_job_params)
        EmailMarketing.find_or_create_by(email: apply_job_params[:email])
        JobMailer.notify_candidate_apply_job(job).deliver_now
        Telegram::PostGroupService.post_group_telegram(ENV['NEW_CANDIDATE_GROUP_ID'],
                                                       "[#{Time.current}] - Hello Anh Em Admin, Have New Candidate Apply Job!!!!!!")
        flash[:applied] = 'Applied successfully'
      rescue StandardError => e
        Sentry.capture_exception(e)
      end
      redirect_to :back
    end

    private

    def job_filter
      {
        title: params[:title],
        location: params[:location],
        commission: params[:commission]
      }.compact
    end

    def apply_job_params
      params.require(:candidate).permit(
        :file,
        :email,
        :from_leader,
        :candidate_name,
        :expected_salary,
        :onboarding_time,
        :apply_by_referral_code
      ).compact
    end
  end
end
