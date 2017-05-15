Rails.application.routes.draw do
  get 'sessions/new'

  resources :user_bets
  resources :bet_options
  resources :payments
  resources :bets
  resources :users
  get '/', to: 'home#index'

  # Sessions  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # Navbar paths
  root 'home#index'

  # Comments
  # post  
  resources :comments
  resources :friends




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
