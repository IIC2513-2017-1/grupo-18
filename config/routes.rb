Rails.application.routes.draw do
  resources :user_bets
  resources :bet_options
  resources :payments
  resources :bets
  resources :users
  get '/', to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
