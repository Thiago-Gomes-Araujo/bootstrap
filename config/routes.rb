Rails.application.routes.draw do
  resources :contracts
  resources :careers
  
  resources :companies, only: [:new, :edit, :update, :create]

  resources :positions , only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :applicants, only: [:index, :new, :create]

  devise_for :users
  
  root "home#index"

end
