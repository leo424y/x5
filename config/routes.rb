Rails.application.routes.draw do
  get 'errors/file_not_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'
  root to: 'tasks#index'
  resources :tasks

  get 'tags/:tag', to: 'tasks#index', as: "tag"
  get 'signup' => 'users#new'
  post 'users' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  namespace :admin do
    resources :users
  end

  get '404', to: 'errors#file_not_found', via: :all
  get '500', to: 'errors#internal_server_error', via: :all
end
