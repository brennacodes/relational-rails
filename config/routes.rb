Rails.application.routes.draw do
  root 'home#index'

  get '/agencies', to: 'agencies#index'
  get '/agencies/:id', to: 'agencies#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
