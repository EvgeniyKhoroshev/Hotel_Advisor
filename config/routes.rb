Rails.application.routes.draw do

  resources :hotels do
    resources :posts, only: [:new, :destroy, :create]
  end

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

  namespace :api do
    namespace :v1 do
      resources :hotels
      resources :users
      resources :sessions, only: [:new, :create, :destroy]

      namespace :admin do
        resources :hotels, only: [:destroy, :index]
      end

      namespace :showhotels do
        resources :users, only: :show
      end

      get 'all_hotels' => 'hotels#index'
      get 'signup' => 'users#new'
      get 'signin' => 'sessions#new'
      delete 'signout' => 'sessions#destroy'
    end
  end

end