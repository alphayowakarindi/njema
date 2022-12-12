Rails.application.routes.draw do
  resources :categorizations
  resources :entities
  resources :groups
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'groups#index'
end
