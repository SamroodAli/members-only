Rails.application.routes.draw do
  resources :members
  devise_for :users
  resources :users
  root 'members#index'
end
