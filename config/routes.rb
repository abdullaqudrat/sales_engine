Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'single_revenue#show'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
      end

      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :customers, only: [:index, :show]

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :transactions, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
