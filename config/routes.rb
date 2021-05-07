Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/destroy'
  get 'users/update'
  get 'users/show'
  devise_for :users
  root 'posts#index'
  resources :users do
    resources :posts
  end
end
