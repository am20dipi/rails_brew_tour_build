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
  # '/beers/:beer_id/reviews'  INDEX  beer_reviews_path
  # '/beers/:beer_id/reviews/new'  NEW  new_beer_review_path

  # shallow routing parameter: will leave INDEX, NEW, CREATE at the nested level - so the routes are not visually long in the URL

  resources :users 
  resources :reviews 

  resources :breweries do 
    resources :beers, only: [:index, :show]
  end



  
end
