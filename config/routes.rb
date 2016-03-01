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
  end

  resources :bookings, only: [:new, :create, :update, :destroy] do
    resources :messages, only: [:new, :create]
  end

  resources :users, except: [:index] do
    resources :messages, only: [:index]
  end

  resource :calendar,     only: [:show]

  resources :slot_ranges, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
