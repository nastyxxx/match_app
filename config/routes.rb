# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'rooms#index'
  resources :users, only: %i[show edit update destroy]
  resources :rooms, only: %i[new create destroy] do
    resources :messages, only: %i[index create]
    collection do
      get 'search'
    end
  end
  resources :cards, only: %i[new create]
end
