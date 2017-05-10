Rails.application.routes.draw do
  
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :users
  resources :orders
  resources :order_items
  resources :schools
  resources :sessions

  # authentication routes
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  get 'index' => 'carts#index', :as => :index
  get 'add_to_cart/:id' => 'carts#add_to_cart', :as => :add_to_cart
  get 'remove_from_cart/:id' => 'carts#remove_from_cart', :as => :remove_from_cart
  get 'destroy_order/:id' => 'orders#destroy', :as => :destroy_order

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  patch 'ship/:id' => 'order_items#ship', as: :ship
  
  # Set the root url
  root :to => 'sessions#new'  

end
