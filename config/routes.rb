Rails.application.routes.draw do
  resources :rewards, only: [:index]
  resources :users, only: [:show, :new, :create]
  namespace :admin do
    resources :users
    resources :rewards
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#show'

  root to: 'rewards#index'
end
