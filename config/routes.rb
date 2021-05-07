Rails.application.routes.draw do
  get 'post/new'
  get 'post/create'
  get 'post/index'
  devise_for :users
  resources :members
  root 'members#index'
end
