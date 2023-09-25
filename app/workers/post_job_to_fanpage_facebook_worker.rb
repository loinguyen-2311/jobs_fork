# frozen_string_literal: true

class PostJobToFanpageFacebookWorker
  include Sidekiq::Worker

  def perform
    FacebookService.new.post_to_fanpage
  end
end
