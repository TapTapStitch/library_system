# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get '/manage_users', to: 'pages#manage_users'
  get '/delete_user', to: 'pages#delete_user'
  devise_for :users
  resources :books do
    member do
      post :borrow
      post :return
    end
    collection do
      get :search
      get :user
    end
  end
end
