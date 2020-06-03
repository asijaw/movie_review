Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :reviews
  resources :movies

  get '/signup', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
