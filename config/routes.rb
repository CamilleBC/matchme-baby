# frozen_string_literal: true

Rails.application.routes.draw do
  get '/about', to: 'home#about'

  devise_for :users

  root 'home#index'
end
