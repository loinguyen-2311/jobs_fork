# frozen_string_literal: true

# require "sentry-ruby"

class NotifyCandidateApplyJobWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find_by(id: job_id)
    JobMailer.notify_candidate_apply_job(job).deliver_now # if Rails.env == 'production'
  rescue ActiveRecord::RecordNotFound => e
    puts e
  end
end
