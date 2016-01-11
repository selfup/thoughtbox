Rails.application.routes.draw do

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'validate' => 'sessions#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users

end
