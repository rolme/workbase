Rails.application.routes.draw do

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
    collection do
      get :closed
      get :deleted
    end
    resources :comments
  end
  resources :inventory, param: :area_slug do
    collection do
      get :search
      resources :unit_categories, except: [:show], param: :slug do
        get :restore, on: :member
      end
      resources :warehouses, param: :slug do
        resources :locations, param: :slug, except: [:index]
      end
    end
    member do
      get :checkin
      post :search_unit
    end
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
    post :confirm_user_company
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

  # for image save(drag&drop)
  resources :uploads, only: [:create, :destroy, :show]

  resources :login, only: [:index]
  post "/emulate", to: "session#emulate"
  post "/login",   to: "session#create"
  get "/logout",   to: "session#destroy"
  get "/register", to: "registration#new"

  # password request
  resources :passwords, only: [:new, :create] do
    collection do
      get :edit
      put :update
    end
  end

  root to: "welcome#index"
end
