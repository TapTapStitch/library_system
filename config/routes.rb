# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
    collection do
      get 'user'
    end
  end
  root 'pages#index'
  get '/update_user_role', to: 'pages#update_user_role'

  devise_for :users
end
