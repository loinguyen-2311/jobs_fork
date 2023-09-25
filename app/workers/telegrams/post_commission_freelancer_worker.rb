# frozen_string_literal: true

class Telegrams::PostCommissionFreelancerWorker
  include Sidekiq::Worker

  def perform
    Telegram::PostCommissionService.post_commission_freelancer
  end
end
