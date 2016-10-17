Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home', as: 'home'
  get '/help', to: 'static_pages#help', as: 'help'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :entries,       only: [:create, :show]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show] do
    member do
      get :following, :followers
    end
  end
end
