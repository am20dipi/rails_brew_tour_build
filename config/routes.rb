Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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



  resources :beers do 
    resources :reviews, shallow: true
  end
  # '/beers/:beer_id/reviews'
  # '/beers/:beer_id/reviews/new'
  # '/beers/:beer_id/reviews/:review_id

  # shallow routing parameter: will leave INDEX, NEW, CREATE at the nested level - so the routes are not visually long in the URL

  post '/beers/:beer_id/reviews' => 'reviews#create'

  resources :users do 
    resources :beers, shallow: true 
  end
  # '/users/:user_id/beers'
  # '/users/:user_id/beers/new'
  # '

  resources :breweries do
    resources :beers, shallow: true
  end

  # '/breweries/:brewery_id/beers'


  resources :reviews 
end
