Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:show]
end
