Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  get 'search_practices', to: 'users#search_practices'
  get 'search_locums', to: 'users#search_locums'

  resources :users, except: [:index] do
    resources :slots, only: [:create, :update, :destroy]
    resources :bookings, only: [:new, :create, :update, :destroy]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :calendar,     only: [:show]

  resources :slot_ranges, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

end
