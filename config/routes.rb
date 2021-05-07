Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  root 'posts#index'
end
