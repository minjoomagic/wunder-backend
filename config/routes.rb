Rails.application.routes.draw do
  resources :items
  resources :users , only: [:create, :index]
  resources :user_items
  resources :stores
  resources :store_items

  get "/get_user", to: "users#get_user"
  post "/login_user", to: "auth#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
