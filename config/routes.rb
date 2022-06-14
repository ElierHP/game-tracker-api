Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "games#index"

  resources :users, only: [:show, :create, :update, :destroy]

  resources :games

  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
