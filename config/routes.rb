Rails.application.routes.draw do

  resources :hotels;
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'static_pages#index'

  get 'all_hotel' => 'hotels#all'
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  delete 'signout' => 'sessions#destroy'

end
