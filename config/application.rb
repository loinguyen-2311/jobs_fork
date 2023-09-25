require_relative 'boot'
require 'rails/all'
require 'csv'
# require "active_storage/engine"
# require "action_mailbox/engine"


# require 'openssl'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Partimebee
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # add app/assets/fonts to the asset path
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "fontsadmin")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "candidates")
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put]
      end
    end
    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :redis_store, "#{ENV['REDIS_URL']}/0/cache"
    config.autoload_paths += Dir["#{Rails.root}/app"]
    config.eager_load_paths << Rails.root.join('lib')
    if Rails.env == 'development'
      OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
    end
  end

end
