Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :slots, only: [:new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

end
