Rails.application.routes.draw do
  resources :workbase, only: [:index]

  resources :login, only: [:index]
  post "/login",   to: "session#create"
  post "/emulate", to: "session#emulate"
  get "/logout",   to: "session#destroy", as: "logout"

  root to: "workbase#index"
end
