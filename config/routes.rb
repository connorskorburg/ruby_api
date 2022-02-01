Rails.application.routes.draw do
  root "user#index"

  get '/users', to: 'user#index'
  post '/users/new', to: 'user#create'
  put '/users/edit/:id', to: 'user#update'
  get '/users/:id', to: 'user#show'

end
