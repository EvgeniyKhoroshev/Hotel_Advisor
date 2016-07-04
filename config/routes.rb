Rails.application.routes.draw do

  resources :hotels
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'static_pages#index'

  namespace :admin do
    resources :hotels, only: [:destroy, :index]
  end

  get 'all_hotels' => 'hotels#index'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  delete 'signout' => 'sessions#destroy'

end