Rails.application.routes.draw do
#  get 'lead_user/new'
  resources :lead_users, only: [:create] do
    get :confirm_email
    get :confirmation_lead, on: :collection
  end
  post 'lead_user/new', to: 'lead_user#create'
  
    
  get 'welcome/index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  mount ActionCable.server => '/cable'

  # api end points for ticket creation
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :tickets, only: [:create]
    end
  end

  # for unauthenticated user actions
  namespace :public do
    resources :tickets, param: :slug, only: [] do
      member do
        put :toggle_close
      end
      collection do
        get :customer
      end
      resources :comments, only: [:create]
    end
  end

  # api end points for ticket creation
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :tickets, only: [:create]
    end
  end

  # for unauthenticated user actions
  namespace :external do
    resources :tickets, param: :slug, only: [] do
      member do
        put :toggle_close
      end
      collection do
        get :customer
      end
      resources :comments, only: [:create]
    end
  end

  resources :clients, param: :slug
  resources :tickets, param: :slug do
    member do
      put :toggle_close
    end
    resources :comments
  end
  resources :inventory, param: :area_slug do
    collection do
      get :search
      resources :unit_categories, except: [:show], param: :slug do
        get :restore, on: :member
      end
    end
    member do
      get :checkin
    end
  end
  resources :warehouses, param: :slug do
    resources :locations, param: :slug, except: [:index]
  end
  resources :procurement
  resources :projects, param: :slug do
    resources :attachments, param: :slug, only: [:index, :create, :update, :destroy]
    resources :proposals, param: :slug do
      resources :sections
    end
  end

  resources :registration, only: [:create] do
    get :confirm_email
    get :confirmation, on: :collection
  end
  resources :units, param: :slug, except: [:index] do
    get :list, on: :collection
  end
  resources :users, only: [:index, :update, :destroy], param: :slug do
    member do
      get :profile
      patch :password_update
    end
  end
  resources :workbase, only: [:index]

  resources :login, only: [:index]
  post "/emulate", to: "session#emulate"
  post "/login",   to: "session#create"
  get "/logout",   to: "session#destroy"
  get "/register", to: "registration#new"

  root to: "welcome#index"
end
