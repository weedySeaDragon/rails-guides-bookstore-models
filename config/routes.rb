Rails.application.routes.draw do

  resources :orders
  resources :reviews
  resources :customers
  resources :books
  resources :suppliers
  resources :authors

  get '/about', to: 'home#about'
  get '/terms', to: 'home#terms'
  get '/models-diagram', to: 'home#models_diagram'


  root to: 'home#index'

end
