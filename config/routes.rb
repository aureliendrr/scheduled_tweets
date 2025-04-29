Rails.application.routes.draw do
  root to: "main#index"

  get "/about", to: "about#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
end
