Rails.application.routes.draw do

  root 'sessions#new'
  resources :maps
  resources :locations
  
  get "users" => "users#index"
  get "users/new" => "users#new" 
  post "users" => "users#create"

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
