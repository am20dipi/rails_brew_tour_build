Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :beers do 
    resources :reviews, only: [:index, :new, :create]
  end
  # '/beers/:beer_id/reviews'
  # '/beers/:beer_id/reviews/new'

  post '/beers/:beer_id/reviews' => 'reviews#create'

  resources :users do 
    resources :beers, only: [:index]
  end
  # '/users/:user_id/beers'

  resources :breweries do
    resources :beers, only: [:show] 
  end

  resources :reviews 


  root 'sessions#home'
  
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 


  get '/login' => 'sessions#new'
  # the route that displays the login page
  get '/auth/:provider/callback' => 'sessions#omniauth'
  post '/login' => 'sessions#create'
  # the route that processes the submission


  
  delete '/logout' => 'sessions#destroy'
  # we don't use "get '/logout' " so that the user does not see it in the URL bar
end
