Rails.application.routes.draw do
  resources :members
  devise_for :users
  resources :users
  root 'posts#index'
end
