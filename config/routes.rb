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

  resources :items, only: [:index, :show]

  end

namespace :admin do

  resources :items, only: [:index, :new, :create, :show, :edit, :update]

  resources :order_details, only: [:update]

  resources :orders, only: [:show, :update]

  resources :customers, only: [:index, :show, :edit, :update]

  resources :genres, only: [:index, :create, :edit, :update]

end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end