Rails.application.routes.draw do
  get "home/index"
  get "layouts/index"
  resources :users

  # Define authentication routes
  get "login", to: "users#new"  # Set login to user signup/login page
  post "login", to: "users#create" # Handles user creation (assuming no SessionsController)
  delete "logout", to: "users#destroy" # Logout (if applicable)

  # Set login/signup page as the root
  root "users#new"
end
