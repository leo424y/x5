Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  namespace :admin do
    resources :users
  end
end
