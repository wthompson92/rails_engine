Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        #Search Endpoints
        get '/find', to: 'search#show'
        get '/find_all', to:'search#index'
        #Random
        get '/random', to:'random#show'
        #Relationships
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        #Buisiness Intelligence
        get '/most_revenue', to: 'revenue#index'
        get '/:id/revenue', to: 'revenue#show'
        get '/api/v1/merchants/most_items?quantity=x', to: 'most_items#index'
        # get '/api/v1/merchants/revenue?date=x'
      # get '/api/v1/merchants/:id/revenue?date=x'
        get  '/api/v1/merchants/:id/favorite_customer' , to: 'customer#show'
        get '/api/v1/merchants/:id/customers_with_pending_invoices' , to: 'customer#index'
      end

      namespace :customers do
        # Relationship Endpoints
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'

        # Buisness Intelligence Endpoints
        get '/:id/favorite_merchant', to: 'merchants#show'
      end

      namespace :invoices do
        # Relationship Endpoints
        get '/:id/transactions', to: 'transactions#index'

        get '/:id/invoice_items', to: 'invoice_items#index'

        get '/:id/customer', to: 'customers#show'

        get '/api/v1/invoices/:id/merchant', to: 'merchants#show'

        get '/api/v1/invoices/:id/items', to: 'items#index'
      end

      namespace :invoice_items do
        # Relationship Endpoints
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
      end

      namespace :items do
        #Relatiinship Routes
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/api/v1/items/:id/merchant' , to: 'merchants#show'
        # Buisiness Intelligence
        get '/api/v1/items/most_revenue?quantity=x', to: 'revenue#index'
        get '/api/v1/items/most_items?quantity=x', to: 'most_sales#index'
        get '/api/v1/items/:id/best_day', to: 'most_sales#show'
      end

      namespace :transactions do
        #Relatiinship Routes
        get '/:id/invoice', to: 'invoices#show'
        # Buisiness Intelligence

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
