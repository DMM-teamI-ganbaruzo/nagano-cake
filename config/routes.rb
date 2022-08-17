Rails.application.routes.draw do

  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
    get 'orders/new'
    get 'orders/check'
    get 'orders/finish'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/reset'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/check'
    get 'customers/withdrawal'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
    get 'registrations/new'
    get 'registrations/create'
    get 'items/index'
    get 'items/show'
  end

  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end

  devise_for :customers
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
