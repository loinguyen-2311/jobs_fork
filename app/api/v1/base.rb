class API::V1::Base < Grape::API
  helpers API::V1::Helpers
  # helpers Garner::Mixins::Rack
  # include API::V3::ExceptionsHandler
  # include Garner::Mixins::Rack
  prefix 'api'
  format :json
  version 'v1'
  use Rack::ConditionalGet
  use Rack::ETag

  # before do
  #   set_access_token
  #   set_locale
  # end

  mount API::V1::Jobs
  mount API::V1::Cvs
  mount API::V1::Githubs
  mount API::V1::GithubEmailMarketings

  add_swagger_documentation(api_version: version, hide_format: true, hide_documentation_path: true)
end
