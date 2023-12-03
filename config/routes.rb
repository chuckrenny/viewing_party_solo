Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"

  get '/register', to: 'users#new'
  post '/register' => 'users#create', as: 'users'

  resources :users, only: [:show] do
    get '/discover', to: 'users#index'
  end
end