Rails.application.routes.draw do
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
      resources :users, only: [:create,:index]
      post "/login", to: "users#login"
      get "/verify", to: "users#verify"
      get "/search", to: "products#search"
      get "/rating", to: "products#rating"
      resources :cart_items
      resources :carts
      resources :user_addresses
      resources :orders
      resources :order_items
      resources :payments
      resources :reviews
      resources :discounts
      resources :discount_items
      resources :sellers
      resources :wishlist_items
      resources :wishlists
    end
  end
end
