Rails.application.routes.draw do
  resources :genres
  # resources :book_genres
  resources :books [:show, :update :destroy]
  resources :reviews
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
