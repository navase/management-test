Rails.application.routes.draw do
  root 'records#index'

  resources :branches
  resources :records

  devise_for :users
end
