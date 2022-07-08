Rails.application.routes.draw do
  resources :departments

  get '/investigations', to: 'investigations#index', as: 'investigations'
  post '/investigations', to: 'investigations#create'                   
  get '/investigations/new', to: 'investigations#new', as: 'new_investigation'
  get '/investigations/:id/edit', to: 'investigations#edit', as: 'edit_investigation'
  get '/investigations/:id', to: 'investigations#show', as: 'investigation'
  patch '/investigations/:id', to: 'investigations#update'
  put '/investigations/:id', to: 'investigations#update'
  delete '/investigations/:id', to: 'investigations#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
