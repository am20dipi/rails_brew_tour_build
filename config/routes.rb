Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :beers do 
    resources :reviews, only: [:index, :new]
  end
  # '/beers/:beer_id/reviews'

  resources :users do 
    resources :beers, only: [:index]
  end
  # '/users/:user_id/beers'

  resources :breweries 
  resources :reviews 


  root 'sessions#home'
  
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 


  get '/login' => 'sessions#new'
  # the route that displays the login page
  post '/login' => 'sessions#create'
  # the route that processes the submission


  
  delete '/logout' => 'sessions#destroy'
  # we don't use "get '/logout' " so that the user does not see it in the URL bar
end
