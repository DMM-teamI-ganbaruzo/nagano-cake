Rails.application.routes.draw do
  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/check'
    get 'orders/finish'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/reset'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/check'
    get 'customers/withdrawal'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  devise_for :customers
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
