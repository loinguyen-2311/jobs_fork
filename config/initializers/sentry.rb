Sentry.init do |config|
  config.dsn = 'https://ddd0a1688dc144358d5f273861fc2bd0@o362235.ingest.sentry.io/4504660351254528'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end