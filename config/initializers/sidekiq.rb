# if Rails.env == "production"
#   Sidekiq.configure_server do |config|
#     config.redis = { url: ENV['REDIS_URL_SERVER'] }
#   end
# else
#   Sidekiq.configure_client do |config|
#     config.redis = { url: ENV['REDIS_URL'] }
#   end
# end
#
# schedule_file = "config/schedule.yml"
# if File.exist?(schedule_file)
#   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end