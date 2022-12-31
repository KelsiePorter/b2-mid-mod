Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #departments
  get '/departments', to: 'departments#index'
  # The above will create a route to display all department instances

  #employees
  get '/employees/:id', to: 'employees#show'

  #employee_tickets
  post '/employees/:employee_id/tickets', to: 'employee_tickets#create'
end
