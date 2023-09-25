require_relative 'boot'
require 'openssl'
require 'rails/all'
require 'csv'  

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Partimebee
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # add app/assets/fonts to the asset path
    # config.assets.paths << Rails.root.join("app", "assets", "fonts") 
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "fontsadmin")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "dropify")
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "home")
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

    config.autoload_paths += %W(#{config.root}/app/core/constants)
    config.autoload_paths += Dir["#{Rails.root}/app"]
    config.eager_load_paths << Rails.root.join('lib')
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  end

end
