Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "static_pages#home"

  resources :products, only: [:show]
  resources :suggestions

  namespace :admin do
    root "products#index"
    resources :products
    resources :users, only: [:index, :show, :destroy]
  end
end
