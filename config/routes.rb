require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_SERVER_USERNAME'], ENV['SIDEKIQ_SERVER_PASSWORD']]
end

Rails.application.routes.draw do
  mount API::V1::Base => '/'
  mount Sidekiq::Web, at: '/sidekiq'
  mount GrapeSwaggerRails::Engine => '/swagger'
  namespace :hr_freelancers do
    get '/sessions/signup', to: 'sessions#sign_up'
    post '/sessions/signup', to: 'sessions#create_user'
    get '/sessions/signin', to: 'sessions#login'
    get '/sessions/forgot', to: 'sessions#forgot'
    post '/sessions/forgot_password', to: 'sessions#forgot_password'
    post '/sessions/:token/update_password', to: 'sessions#update_password'
    post '/sessions/signin', to: 'sessions#signin'
    get '/sessions/logout', to: 'sessions#logout'
    get '/sessions/:token/new_password', to: 'sessions#new_password'
  end
  resources :hr_freelancers
  get '/hr_freelancers_email_verification/:confirm_token', to: 'hr_freelancers/sessions#hr_freelancers_email_verification'
  get '', to: 'candidates/home#index'
  get '/single_job/:id', to: 'candidates/home#single_job'
  get '/hr_freelancers_job/:id', to: 'candidates/home#hr_freelancers_job'
  get '/candidate_jobs', to: 'candidates/home#job_list'
  get '/remote_jobs', to: 'candidates/home#remote_jobs'
  get '/hr_freelancer_jobs', to: 'candidates/home#hr_freelancer_jobs'
  get '/privacy', to: 'candidates/home#privacy'
  get 'login', to: 'candidates/login#index'
  post '/apply_job', to: 'candidates/home#apply_job'

  namespace :admin do
    resources :users
    resources :sessions
    get '/', to: 'sessions#index'
    get '/login', to: 'sessions#index'
    post '/login', to: 'sessions#login'
    get '/logout', to: 'sessions#logout'
    resources :email_marketings
    resources :jobs do
      resources :cvs
    end
    resources :cvs do
      collection do
        post '/change_status', to: 'cvs#change_status'
      end
    end
    post '/blocking', to: 'users#block_and_unblock'
    post '/job/approve', to: 'jobs#approve_job'
  end
end
