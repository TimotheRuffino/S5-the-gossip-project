Rails.application.routes.draw do
  root 'root#index'
  resources :gossips

  resources :welcome, only: [:index]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :root, only: [:index]
end
