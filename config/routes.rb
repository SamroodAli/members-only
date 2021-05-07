Rails.application.routes.draw do
  devise_for :users
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  root 'posts#index'
end
