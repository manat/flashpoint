Rails.application.routes.draw do

  resources :games do
    resources :players, only:[:create]
  end
  resources :players, only: [:destroy]
  post 'players/:id/roll', to: 'players#roll'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home/index", to: "home#index", as: "home"

  root to: "games#index"


end
