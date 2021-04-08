Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :beers
  resources :users
  resources :breweries
  resources :reviews 
end
