Rails.application.routes.draw do
  post '/users/sign_in_as_a_guest', to: 'users#guest'
  post '/users/sign_in_as_an_admin', to: 'users#admin'
  
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
  resources :games do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :reviews
  resources :owns, only: [:index, :create, :destroy]
  resources :favorites, only: [:index,:create, :destroy]
  resources :users

  namespace :admin do
    root 'games#index'
    resources :games do
      resources :comments, only: [:create, :destroy]
    end
    
    resources :reviews
    resources :owns, only: [:index, :create, :destroy]
    resources :favorites, only: [:index,:create, :destroy]
    resources :users    
  end

  
end
