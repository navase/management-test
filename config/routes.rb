Rails.application.routes.draw do
  root 'registrations#index'
  
  resources :branches
  resources :registrations

  devise_for :users
end
