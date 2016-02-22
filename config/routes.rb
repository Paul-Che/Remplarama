Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users do
    resources :slots, only: [:create, :update, :destroy]
    resources :bookings, only: [:create, :update, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  mount Attachinary::Engine => "/attachinary"

end
