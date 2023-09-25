# frozen_string_literal: true

class AutoDeleteClosedJobWorker
  include Sidekiq::Worker

  def perform
    ActiveRecord::Base.connection.execute(
      <<~SQL
        DELETE FROM jobs WHERE status = 4
        AND id NOT IN (SELECT jobs.id FROM jobs INNER JOIN cvs ON jobs.id = cvs.job_id)
      SQL
    )
  end
end
