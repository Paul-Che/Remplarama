Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  get 'search_practices', to: 'users#search_practices'
  get 'search_locums', to: 'users#search_locums'
  get 'verify', to: 'users#verify'
  get 'accepted_bookings', to: 'bookings#index_accepted_bookings'

  resources :users, except: [:index] do
    resources :slots, only: [:create, :destroy]
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :slots, only: [:show]

  resources :bookings, only: [:show, :destroy, :update] do
    resources :contracts, only: [:new, :create, :show]
    member do
      patch 'confirm'
      patch 'reject'
    end
  end


  resources :conversations, only: :index do
    resources :messages, only: :create
  end

  resource :messages, only: [:new, :creat_new] do
    collection do
      post 'create_new'
    end
  end

  resource :calendar, only: :show

  # resources :slot_ranges, only: [:destroy] A detruire

  mount Attachinary::Engine => "/attachinary"

end
