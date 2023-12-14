# frozen_string_literal: true
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register' => 'users#create', as: 'users'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  resources :users, only: [:show] do
    get '/discover', to: 'users#discover'
    resources :movies, only: [:index]
  end
end
