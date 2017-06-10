Rails.application.routes.draw do
  get 'sessions/new'

  resources :user_bets
  resources :bet_options
  resources :payments
  resources :bets do
    collection do
      get 'export', as: 'export'
    end
  end
  resources :users
  get '/', to: 'home#index', as: 'home'

  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  # Navbar paths
  root 'home#index'

  # Comments
  # post
  resources :comments
  resources :friends

  resources :account_activations, only: [:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
