Rails.application.routes.draw do
  get 'companies/new'
  get 'companies/edit'
  get 'companies/index'

  resources :companies, only: [:new, :edit, :update, :create]

  resources :positions

  resources :applicants, only: [:index, :new, :create]

  devise_for :users
  
  root "home#index"

end
