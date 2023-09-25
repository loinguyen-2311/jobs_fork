# frozen_string_literal: true

class DtalentSyncJobWorker
  include Sidekiq::Worker

  def perform
    DtalentSyncJobService.new.sync_job
    # HTTParty.get('https://devfinding.com/api/v1/jobs/dtalent_job_title')
  end
end
