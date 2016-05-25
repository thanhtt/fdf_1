Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "products#index"

  resources :orders, only: [:show, :update, :index]
  resources :line_items, only: [:show, :create, :update, :destroy]
  resources :products, only: [:show, :index] do
    resources :comments
    collection{post :search, to: "products#index"}
  end
  resources :suggestions

  resources :users do
    resources :orders, except: [:destroy]
  end

  namespace :admin do
    root "products#index"
    resources :products
    resources :users, only: [:index, :show, :destroy]
    resources :suggestions, only: [:index, :show, :destroy]
    resources :categories, except: [:show]
  end
end
