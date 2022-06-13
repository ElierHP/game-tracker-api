Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "games#index"

  resources :games
  resources :users, only: [:show, :create, :update, :destroy]

  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
