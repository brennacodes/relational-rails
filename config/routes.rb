Rails.application.routes.draw do
  get '/departments', to: 'departments#index', as: 'departments'
  post '/departments', to: 'departments#create'                   
  get '/departments/new', to: 'departments#new', as: 'new_department'
  get '/departments/:id/edit', to: 'departments#edit', as: 'edit_department'
  get '/departments/:id', to: 'departments#show', as: 'department'
  patch '/departments/:id', to: 'departments#update'
  put '/departments/:id', to: 'departments#update'
  delete '/departments/:id', to: 'departments#destroy'

  get '/departments/:id/investigations', to: 'department_cases#index', as: 'department_cases'
  get '/departments/:id/investigations/new', to: 'department_cases#new', as: 'new_dept_investigation'
  post '/departments/:id/investigations', to: 'department_cases#create'

  get '/investigations', to: 'investigations#index', as: 'investigations'
  post '/investigations', to: 'investigations#create'                   
  get '/investigations/new', to: 'investigations#new', as: 'new_investigation'
  get '/investigations/:id', to: 'investigations#show', as: 'investigation'
  patch '/investigations/:id', to: 'investigations#update'
  put '/investigations/:id', to: 'investigations#update'
  delete '/investigations/:id', to: 'investigations#destroy', as: 'delete_investigation'
  get '/investigations/:id/edit', to: 'investigations#edit', as: 'edit_investigation'
  post '/investigations/:id/edit', to: 'investigations#edit'

  get '/search', to: 'department_cases#index', as: 'department_caes_search'
end
