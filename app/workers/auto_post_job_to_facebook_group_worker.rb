# frozen_string_literal: true

class AutoPostJobToFacebookGroupWorker
  include Sidekiq::Worker

  def perform
    FacebookService.new.post_to_groups
  end
end
