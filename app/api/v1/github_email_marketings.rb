class API::V1::GithubEmailMarketings < Grape::API
  helpers API::V1::Helpers
  resource :github_email_marketings do
    desc 'Get GithubEmailMarketing',
         entity: API::Entities::V1::Job
    params do
    end
    get :all do
      present GithubEmailMarketing.all
    end
  end
end
