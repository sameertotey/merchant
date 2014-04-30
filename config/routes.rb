Rails.application.routes.draw do

  root 'products#index'

  resources :orders

  resources :order_items, only: [:show, :edit, :update, :destroy, :create]

  resources :products

  match '/auth/:provider/callback', to: 'sessions#create', via: :get

end
