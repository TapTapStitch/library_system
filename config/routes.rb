# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books
  root 'pages#index'
  devise_for :users
end
