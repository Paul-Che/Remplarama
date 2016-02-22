Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :slots, only: [:new, :create, :edit, :update, :destroy]

  resources :users

end
