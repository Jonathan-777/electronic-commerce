Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get "home" => "home#index"
  get "layouts" => "layouts#index"
  resources :users

  # Define authentication routes
  get "login" => "users#new"  # Login page (signup form)
  post "login" => "users#create" # Handles user creation
  delete "logout" => "users#destroy" # Logout action

  # Set login/signup page as the root
  resources :products
  root "products#index"
  post "cart", to: "cart#add", as: "cart"



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"w"
end
