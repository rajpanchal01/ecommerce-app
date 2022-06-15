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
    end
  end
end
