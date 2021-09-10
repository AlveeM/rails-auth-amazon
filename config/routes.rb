Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/user_profile", to: "users#show"

  # post "/photos", to: "photos#create"
  resources :photos, only: [:index, :create]
end
