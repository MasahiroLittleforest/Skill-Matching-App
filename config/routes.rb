# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user_links/show'
  get 'user_links/new'
  get 'user_links/create'
  get 'user_links/edit'
  get 'user_links/update'
  get 'user_links/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

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
  resources :experiences, only: %i[show new create edit update destroy]
  resources :certifications, only: %i[show new create edit update destroy]
  resources :lessons
  resources :user_links, only: %i[show new create edit update destroy]
end
