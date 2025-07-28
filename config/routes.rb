Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  
  resources :conversations, only: [:create, :show, :index] do
    resources :messages, only: [:create]
  end
  
  resources :workshops, only: [:index, :show]
  resources :appointments, only: [:create, :show]
end

