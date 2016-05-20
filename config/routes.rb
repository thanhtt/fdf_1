Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "static_pages#home"

  resources :products, only: [:show]

  namespace :admin do
    root "products#index"
    resources :products
  end
end
