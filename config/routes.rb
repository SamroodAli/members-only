Rails.application.routes.draw do
  resources :members
  resources :users
  root 'members#index'
end
