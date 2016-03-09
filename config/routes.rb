Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  get 'search_practices', to: 'users#search_practices'
  get 'search_locums', to: 'users#search_locums'
  get 'profile', to: 'users#profile'

  resources :users, except: [:index] do
    resources :slots, only: [:create, :update, :destroy]
    resources :bookings, only: [:new, :create, :update, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    # resources :messages, only: [:index]
  end

  # resources :bookings, only: [:new, :create, :update, :destroy] do
  #   resources :messages, only: [:new, :create]
  #   member do
  #     patch 'confirm'
  #     patch 'reject'
  #   end
  # end

  resources :conversations, only: :index do
    resources :messages, only: :create
  end

  resource :calendar,     only: [:show]

  # resources :slot_ranges, only: [:destroy] A detruire

  mount Attachinary::Engine => "/attachinary"

end
