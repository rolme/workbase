Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :clients
  resources :inventory do
    resources :unit_categories
  end
  resources :locations, except: [:index]
  resources :procurement

  resources :projects do
    resources :attachments, only: [:index, :create, :update, :destroy]
    resources :proposals do
      resources :sections
    end
  end

  resources :registration, only: [:create] do
    get :confirm_email
    get :confirmation, on: :collection
  end
  resources :units, except: [:index] do
    get :list, on: :member
  end
  resources :workbase, only: [:index]

  resources :login, only: [:index]
  post "/emulate", to: "session#emulate"
  post "/login",   to: "session#create"
  get "/logout",   to: "session#destroy"
  get "/register", to: "registration#new"

  root to: "workbase#index"
end
