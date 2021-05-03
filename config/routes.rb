Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#home'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 

  get '/login' => 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  post '/login' => 'sessions#create'
  
  
  delete '/logout' => 'sessions#destroy'
 



  resources :beers do 
    resources :reviews, shallow: true 
  end


  resources :users 
  resources :reviews 

  resources :breweries do 
    resources :beers, only: [:index, :show]
  end



  
end
