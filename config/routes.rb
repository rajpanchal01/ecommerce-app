Rails.application.routes.draw do
  resources :cart_items
  resources :carts
  resources :user_addresses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'v1' do
      resources :brands
      resources :main_categories
      resources :inventories
      resources :products
      resources :sub_categories
      resources :users, only: [:create]
      post "/login", to: "users#login"
    end
  end
end
