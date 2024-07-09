Rails.application.routes.draw do
  resources :contracts
  resources :careers
  
  resources :companies, only: [:new, :edit, :update, :create]

  resources :positions

  resources :applicants, only: [:index, :new, :create]

  devise_for :users
  
  root "home#index"

end
