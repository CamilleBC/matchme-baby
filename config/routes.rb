Rails.application.routes.draw do
  get '/about', to: 'home#about'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  },
                     path_prefix: 'devise'
  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_path
  end

  resources :users, only: %i[index show update destroy] do
    member do
      post :restore
      resources :medium, only: %i[create destroy] do
        member do
          post :avatar
        end
      end
    end
  end

  root 'home#index'
end
