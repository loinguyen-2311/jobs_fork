source "https://rubygems.org"
ruby "2.6.5"

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?("/")
  'https://github.com/#{repo_name}.git'
end

gem "rails", "~> 5.0.1"
gem "rotp"
gem "sweet-alert2-rails"
gem "select2-rails"
gem "open_uri_redirections"
gem "paperclip"
gem "rubocop"
gem "will_paginate", "~> 3.1"
gem "rack-cors", require: "rack/cors"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "figaro"
gem "pg"
gem "jwt"
gem "will_paginate-bootstrap"

# sidekiq
gem "sidekiq"
gem "sidekiq-cron"
gem "sidekiq-gelf"

# Add redis
gem "redis", "4.2.5"
gem "redis-namespace", "1.8.1"
gem "redis-rails", "5.0.2"
gem "redis-rack-cache", "2.2.1"
gem "enumerize"
gem "nested_form"
gem "trix"
gem "httparty"
gem "koala", "~> 3.2.0"
gem "pg_search"
gem "aws-sdk-s3"
gem "email_validator"
gem "friendly_id"
gem "sentry-ruby", "4.5.1"
gem "sentry-rails", "4.5.1"
gem "nokogiri"
gem "rails-patterns"
gem "sendgrid-ruby"

# grape api ===> add config.autoload_paths += Dir["#{Rails.root}/app"] to application.rb
gem "grape"
# dùng để code api
gem "grape-entity"
# dùng để format lại response các bạn muốn trả ra như nào, gem này tương tự như gem 'active_model_serializers'
gem "grape-swagger"
gem "grape-swagger-rails"
gem "grape-swagger-entity"
gem "grape-rails-cache"
gem 'grape_on_rails_routes'
# rails grape:routes, kiểm tra routes

group :test do
  gem "shoulda-matchers", "4.0.0.rc1"
  gem "rails-controller-testing" # If you are using Rails 5.x
  gem "capybara"
  gem "site_prism"
  gem "email_spec"
  gem "database_cleaner"
  gem "faker"
  gem "rspec"
  gem "factory_girl_rails"
  gem "rspec_junit_formatter"
  gem "rspec-rails"
end

group :development do
  gem "dotenv-rails"
  gem "rails_best_practices"
  gem "web-console", ">= 3.3.0"
end

group :development, :test, :production do
  gem "pry-rails"
  gem "byebug", platform: :mri
end
# gem 'searchkick'
gem 'meilisearch'
