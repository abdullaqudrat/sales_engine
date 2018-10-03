Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/revenue', to: 'revenue#index'
      end
      resources :merchants, only: [:index, :show]
    end
  end
end
