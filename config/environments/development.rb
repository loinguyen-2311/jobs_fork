Rails.application.configure do
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local    = true
  config.active_record.default_timezone = :local
  config.time_zone                      = 'Bangkok'

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store                       = :redis_store, "#{ENV['REDIS_URL']}"
    config.public_file_server.headers        = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = true
    config.cache_store                       = :redis_store, "#{ENV['REDIS_URL']}"
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options   = { host: 'localhost:3000' }
  routes.default_url_options                 = { host: 'localhost', port: 3000 }
  config.action_mailer.perform_caching       = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  config.action_mailer.delivery_method = :smtp
  ActionMailer::Base.smtp_settings     = {
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
end
