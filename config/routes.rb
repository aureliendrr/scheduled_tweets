Rails.application.routes.draw do
  root to: "main#index"

  get "/about", to: "about#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "password", to: "passwords#edit", as: "edit_password"
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"

  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/update", to: "password_reset#update"

  namespace :dashboard do
    get "home", to: "home#index"
    resources :prospects
    resources :interactions, only: [ :create ]
    resources :follow_ups
    resources :history
    resources :settings
  end
end
