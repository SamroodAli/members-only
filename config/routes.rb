Rails.application.routes.draw do
  devise_for :users
  resources :post
  root 'post#index'
end
