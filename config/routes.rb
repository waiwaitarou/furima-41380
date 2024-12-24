Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'items/index'
  # Defines the root path route ("/")
  root to: "items#index"
  resources :items
  # root "articles#index"
end
