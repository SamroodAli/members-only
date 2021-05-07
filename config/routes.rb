Rails.application.routes.draw do
  devise_for :users
  resources :members
  root 'members#index'
end
