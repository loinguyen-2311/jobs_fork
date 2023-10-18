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
  # liên kết các api với định tuyến Grape

  add_swagger_documentation(api_version: version, hide_format: true, hide_documentation_path: true)
  # Tự động tạo tài liệu Swagger cho API.
  # Swagger là một công cụ tuyệt vời để tạo và xem tài liệu API, giúp cho việc hiểu rõ cách sử dụng các endpoint mà không cần đọc mã nguồn.
end
