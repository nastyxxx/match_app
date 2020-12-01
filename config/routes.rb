Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'rooms#index'
  resources :users, only: %i[index show edit update destroy]
  resources :rooms, only: %i[new create destroy] do
    resources :messages, only: %i[index create]
    collection do
      get 'search'
    end
  end
  resources :cards, only: [:new, :create, :destroy]
end
