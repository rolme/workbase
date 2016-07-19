Rails.application.routes.draw do
  resources :login, only: [:index]
  resources :workbase, only: [:index]

  root to: "workbase#index"
end
