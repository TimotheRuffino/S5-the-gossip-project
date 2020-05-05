Rails.application.routes.draw do
  resources :gossips
  get '/', to: 'static#index'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:id', to: 'static#welcome'
  get root 'static#index'
  get '/show', to: 'static#show'
  get '/show/:id', to: 'static#show'
end
