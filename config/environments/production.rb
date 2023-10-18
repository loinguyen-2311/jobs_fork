Rails.application.configure do
  config.cache_classes = true
  config.eager_load    = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.active_record.default_timezone    = :local
  config.time_zone                         = 'Kuala Lumpur'

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags                      = [:request_id]
  config.action_mailer.perform_caching = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  routes.default_url_options = { protocol: 'https', host: ENV['DOMAIN'] }

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options         = { host: "https://#{ENV['DOMAIN']}" }
  config.action_mailer.delivery_method             = :smtp
  ActionMailer::Base.smtp_settings                 = {
    user_name:            ENV['SMTP_USERNAME'],
    password:             ENV['SMTP_PASSWORD'],
    domain:               ENV['SMTP_DOMAIN'],
    address:              ENV['SMTP_HOST'],
    port:                 ENV['SMTP_PORT'].to_i,
    authentication:       :plain,
    enable_starttls_auto: true
  }
  # Paperclip config:
  Paperclip.options[:image_magick_path] = '/opt/ImageMagick/bin'
  Paperclip.options[:command_path]      = '/opt/ImageMagick/bin'

  # Config for S3
  config.paperclip_defaults = {
    storage:        :s3,
    s3_credentials: {
      bucket:            ENV.fetch('S3_BUCKET_NAME'),
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region:         ENV.fetch('AWS_REGION')
    }
  }
  # config.cache_store        = :redis_cache_store, { url: ENV['REDIS_URL'] }
end
