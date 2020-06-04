Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :reviews
  resources :movies

  root 'application#home'

  get '/signup', to: 'users#new'

  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  

end
