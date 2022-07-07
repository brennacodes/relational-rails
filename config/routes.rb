Rails.application.routes.draw do
  resources :departments

  get '/cases', to: 'cases#index', as: 'cases'
  post '/cases', to: 'cases#create'                   
  get '/cases/new', to: 'cases#new', as: 'new_case'
  get '/cases/:id/edit', to: 'cases#edit', as: 'edit_case'
  get '/cases/:id', to: 'cases#show', as: 'case'
  patch '/cases/:id',to: 'cases#update'
  put    '/cases/:id', to: 'cases#update'
  delete '/cases/:id', to: 'cases#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
