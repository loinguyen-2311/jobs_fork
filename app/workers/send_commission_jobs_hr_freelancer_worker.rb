class SendCommissionJobsHrFreelancerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    User.where(email_confirmed: true).hr_freelancer.map do |hr_freelancer|
      begin
        HrFreelancerMailer.send_commission_jobs_hr_freelancer(hr_freelancer.email).deliver_now
      rescue StandardError => e
        Sentry.capture_exception(e)
      end
    end
  end
end
