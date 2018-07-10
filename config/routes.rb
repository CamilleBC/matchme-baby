# frozen_string_literal: true

Rails.application.routes.draw do
  get '/about', to: 'home#about'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, path_prefix: 'devise'
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_path
  end
  resources :users

  root 'home#index'
end
