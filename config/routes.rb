# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  root 'pages#index'
  get '/update_user_role', to: 'pages#update_user_role'
  devise_for :users
end
