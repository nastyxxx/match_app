Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
