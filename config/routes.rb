Rails.application.routes.draw do
  root 'games#index'
  resources :games
  # resources :comments
  # resources :reviews
  # resources :review_categories
  # resources :review_scores
  # resources :having_games, only: [:create, :destroy]
  # resources :likes, only: [:create, :destroy]
  # resources :users
  # devise_for :users #, only: [:create, :destroy]
end
