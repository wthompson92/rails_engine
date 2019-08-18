Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to:'search#index'
        get '/random', to:'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/most_revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'revenue#show'

      end

    namespace :customers do
      get '/:id/favorite_merchant', to: 'favorite#show'
      get '/:id/invoices', to: 'invoices#index'
    end

    namespace :invoices do

      get '/:id/transactions', to: 'transactions#index'
      get '/:id/invoice_items', to: 'invoice_items#index'
      get '/:id/customers', to: 'customers#index'
        get '/api/v1/invoices/:id/merchant', to: 'merchants#show'

    end

    namespace :invoice_items do
      get '/:id/invoice', to: 'invoices#show'
      get '/:id/item', to: 'items#show'

    end


    resources :merchants, only: [:index, :show]
    resources :items, only: [:show, :index]
    resources :customers, only: [:show, :index]
    resources :invoices, only: [:show, :index]
    resources :invoice_items, only: [:show, :index]
    resources :transactions, only: [:show, :index]
    end
  end
end
