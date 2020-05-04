Rails.application.routes.draw do
  get '/', to: 'static#index'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/welcome/:id', to: 'static#welcome'
  get root 'static#index'
  get '/show', to: 'static#show'
end
