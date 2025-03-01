Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "prototypes#index"
  
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end

  resources :users, only: :show
end