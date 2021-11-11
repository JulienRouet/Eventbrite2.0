# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'event#index'
  resources :event do
    resources :charges, only: %i[new create]
    resources :attendances, only: %i[index]
  end
  resources :user, only: %i[show edit update]
end
