# frozen_string_literal: true

class Telegrams::PostToPartnerWorker
  include Sidekiq::Worker

  def perform
    group_to_post = 'partner'
    Telegram::PostGroupService.call(group_to_post)
  end
end
