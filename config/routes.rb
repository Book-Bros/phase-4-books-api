Rails.application.routes.draw do
  resources :genres
  # resources :book_genres
  resources :books, only: [:show, :update, :destroy]
  # resources :reviews, only:[:create]
  # resources :users, only: [:]


# user
  post '/users', to: 'users#create'
  post '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  get '/users/checklogin', to: 'users#check_logged_in'

  # Reviews
post '/books/:book_id/reviews', to: "reviews#create"
get '/books/:book_id/reviews/:id', to: "reviews#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
