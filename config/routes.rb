Rails.application.routes.draw do

  resources :games do
    resources :players, only:[:create, :destroy]
  end
  post 'players/:id/roll', to: 'players#roll', as: 'players_roll'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home/index", to: "home#index", as: "home"

  root to: "games#index"


end
