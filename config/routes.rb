Rails.application.routes.draw do
  resources :users, except: [:new]
  resources :reviews
  resources :movies

  root 'application#home'

  get '/signup', to: 'users#new'

  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  resources :movies do
    resources :reviews
  end 

  resources :users, only: [:show, :delete] do
    resources :reviews
end


  

end
