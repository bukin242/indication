Rails.application.routes.draw do

  root to: 'root#index'
  resources :users, only: [:new, :create]
  resources :users_admin, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
