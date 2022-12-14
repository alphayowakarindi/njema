Rails.application.routes.draw do
  resources :categorizations
  resources :entities
  resources :groups
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'splash#index'

  # redirect on refresh after sign up fails
  get '/users', to: redirect('/users/sign_up')
end
