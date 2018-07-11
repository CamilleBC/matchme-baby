Rails.application.routes.draw do
  get '/about', to: 'home#about'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path_prefix: 'devise'
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_path
  end

  resources :users do
    member do
      post :restore
    end
    resources :pictures, only: %i[create destroy] do
      member do
        post :avatar
      end
    end
    resources :videos, only: %i[create destroy]
  end

  root 'home#index'
end
