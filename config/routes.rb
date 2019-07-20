Rails.application.routes.draw do
  get 'teachers/show'
  get 'teachers/create'
  get 'teachers/edit'
  get 'teachers/update'
  get 'teachers/destroy'
  get 'teacher_activates/create'
  get 'teacher_activates/destroy'
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
  resources :user_relationships, only: [:create, :destroy]
  resources :teachers, only: [:show, :create, :edit, :update, :destroy]
  resources :teacher_activations, only: [:create]
end
