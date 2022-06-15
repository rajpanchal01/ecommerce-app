Rails.application.routes.draw do
  resources :carts
  resources :user_addresses
  resources :payments
  resources :orders
  resources :users
  resources :order_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
