Rails.application.routes.draw do

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


scope module: :public do

  root :to =>"homes#top"
  get "/about"=>"homes#about"

  resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]

  post 'orders/check'
  get 'orders/finish'

  resources :orders, only: [:new, :create, :index, :show]

  delete 'cart_items/reset'
  resources :cart_items, only: [:create, :index, :update, :destroy]

  get 'customers/check'
  patch 'customers/withdrawal'
  resources :customers, only: [:show, :edit, :update]


  resources :items, only: [:index, :show]

end

namespace :admin do

  get '/' => "homes#top"

  resources :items, only: [:index, :new, :create, :show, :edit, :update]

  resources :order_details, only: [:update]

  resources :orders, only: [:show, :update]

  resources :customers, only: [:index, :show, :edit, :update]

  resources :genres, only: [:index, :create, :edit, :update]

end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
