Rails.application.routes.draw do

  resources :orders
  resources :reviews
  resources :customers
  resources :books
  resources :suppliers
  resources :authors

  get '/about', to: 'home#about'
  get '/terms', to: 'home#terms'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
