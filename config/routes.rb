Rails.application.routes.draw do

  root 'welcome#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'validate' => 'sessions#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/links' => 'links#index'
  resources :users

  namespace :api do
    namespace :v1 do
      resources :links, only: [:show, :index, :destroy, :update, :create], defaults: { format: 'json' } do

      end
    end
  end

end
