Rails.application.routes.draw do

namespace :public do

  resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  
  post 'orders/check'
  get 'orders/finish'
  
  resources :orders, only: [:new, :create, :index, :show]

  resources :cart_items, only: [:index, :update, :destroy]
  delete 'cart_items/reset'
  
  resources :customers, only: [:show, :edit, :update]
  get 'customers/check'
  patch 'customers/withdrawal'
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :registrations, only: [:new, :create]

  resources :items, only: [:index, :show]

  end
  
  namespace :admin do
  
  resources :items, only: [:index, :new, :create, :show, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]

  resources :order_details, only: [:update]

  resources :orders, only: [:show, :update]
  
  resources :customers, only: [:index, :show, :edit, :update]

  resources :genres, only: [:index, :create, :edit, :update]

end

devise_for :customers

devise_for :admins

devise_for :users

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end