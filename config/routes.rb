Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 
  
  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  root 'games#index'
  resources :games
  # resources :comments
  resources :reviews
  # resources :review_categories
  # resources :review_scores
  # resources :having_games, only: [:create, :destroy]
  # resources :likes, only: [:create, :destroy]
  resources :users
  
  
end
