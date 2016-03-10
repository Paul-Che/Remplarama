Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  get 'search_practices', to: 'users#search_practices'
  get 'search_locums', to: 'users#search_locums'
  # get 'profile', to: 'users#profile'

  resources :users, except: [:index] do
    resources :slots, only: [:create, :destroy]
    resources :bookings, only: [:new, :create, :update]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :slots, only: [:show]

  resources :bookings, only: [:destroy] do
    member do
      patch 'confirm'
      patch 'reject'
    end
  end

  resources :conversations, only: :index do
    resources :messages, only: :create
  end

  resource :calendar,     only: [:show]

  # resources :slot_ranges, only: [:destroy] A detruire

  mount Attachinary::Engine => "/attachinary"

end
