# frozen_string_literal: true

class Telegrams::PostJobsToGroupWorker
  include Sidekiq::Worker

  def perform
    group_to_post = 'dev'
    Telegram::PostGroupService.call(group_to_post)
  end
end
