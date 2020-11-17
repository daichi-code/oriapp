Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: :show do
    get :followings, on: :member
    get :followers, on: :member
    get :likes, on: :member
    get :liked, on: :member
  end

  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

  resources :relationships, only: [:create, :destroy]
end
