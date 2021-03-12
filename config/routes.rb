Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/user', to: 'users#create'
  post '/appointment', to: 'appointments#create'
  get '/appointments/:id', to: 'appointments#show'
  patch '/appointments/:id', to: 'appointments#edit' 
end
