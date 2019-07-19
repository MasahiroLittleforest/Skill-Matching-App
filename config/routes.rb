Rails.application.routes.draw do
  get 'user_relatiomships/create'
  get 'user_relatiomships/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'home#index', as: :unauthenticated_root
    end
  end
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  resources :user_relationships, only: [:create, :destroy]
end
