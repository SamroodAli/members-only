Rails.application.routes.draw do
  devise_for :users
  resources :members
  resources :post
  root 'post#index'
end
