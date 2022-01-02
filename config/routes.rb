Rails.application.routes.draw do
  root 'players#score_board'

  resources :games
  resources :players do
    collection do
      get :score_board
      get :all_scores
    end
  end
end
