Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root 'static_pages#home'
  get '/home',      to: 'static_pages#home', as: 'home'
  get '/help',      to: 'static_pages#help', as: 'help'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :comments,      only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :entries
  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :api do
    namespace :v1 do
      resources :entries
    end
  end
end
