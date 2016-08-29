Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  # api end points for ticket creation
  scope '/api' do
    scope '/v1' do
      scope '/projects' do
        scope '/:project_slug' do
          scope '/tickets' do
            post '/' => 'api_projects#create'
          end
        end
      end
    end
  end

  resources :clients, param: :slug
  resources :tickets, param: :slug do
    member do
      put :toggle_close
    end
    collection do
      get :customer
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
    end
  end
  resources :workbase, only: [:index]

  resources :login, only: [:index]
  post "/emulate", to: "session#emulate"
  post "/login",   to: "session#create"
  get "/logout",   to: "session#destroy"
  get "/register", to: "registration#new"

  root to: "workbase#index"
end
