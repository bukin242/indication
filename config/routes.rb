Rails.application.routes.draw do

  root to: 'root#index'
  resources :users
  resources :users_admin, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'password_reset', to: 'password_reset#new'
  post 'password_reset', to: 'password_reset#create'

  resources :indicate, only: [:new, :create]
end
