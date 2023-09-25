class API::V1::Githubs < Grape::API
  helpers API::V1::Helpers
  resource :githubs do
    desc 'Get Users',
         entity: API::Entities::V1::Job
    params do
    end
    get :users do
      user_from_index = 0
      present Github::GetUserService.call(user_from_index)
    end

    desc 'Import Users',
         entity: API::Entities::V1::Job
    params do
    end
    get :import_users do
      present Github::ImportUsersService.call
    end
  end
end
