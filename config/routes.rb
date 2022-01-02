Rails.application.routes.draw do
  root 'players#score_board'

  resources :games
  resources :players do
    collection do
      get :score_board
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
