Rails.application.routes.draw do

  get '/api/articles/:slug', to: "articles#get"
  get '/api/articles/', to: 'articles#get_all'
  post '/api/articles' , to: "articles#create"
  put '/api/articles/:slug', to: 'articles#update'
  delete '/api/articles/:slug', to: 'articles#delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
