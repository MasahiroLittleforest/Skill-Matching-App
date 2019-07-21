# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'landing_pages#index', as: :unauthenticated_root
    end
  end
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  resources :user_relationships, only: %i[create destroy]
  resources :teachers, only: %i[show create edit update destroy]
  resources :teacher_activations, only: [:create]
  resources :skills, only: %i[show new create edit update destroy]
end
