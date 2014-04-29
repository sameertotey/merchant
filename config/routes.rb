Rails.application.routes.draw do

  root 'products#index'

  resources :orders

  resources :order_items, only: [:show, :edit, :update, :destroy, :create]

  resources :products


end
