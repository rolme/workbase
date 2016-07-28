Rails.application.routes.draw do

  resources :registration, only: [:create] do
    get :confirm_email
    get :confirmation, on: :collection
  end

  resources :workbase, only: [:index]

  resources :login, only: [:index]
  post "/emulate", to: "session#emulate"
  post "/login",   to: "session#create"
  get "/logout",   to: "session#destroy"
  get "/register", to: "registration#new"

  root to: "workbase#index"
end
