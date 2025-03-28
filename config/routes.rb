Rails.application.routes.draw do
  get "checkouts/new"
  get "checkouts/create"
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


    get "home" => "home#index"
    get "layouts" => "layouts#index"
    resources :users
    resources :products, only: [ :index, :show ]
    resources :checkouts, only: [ :new, :create ]
    post "cart/add/:product_id", to: "cart#add", as: "cart_add"


    # Define authentication routes
    get "login" => "users#new"  # Login page (signup form)
    post "login" => "users#create" # Handles user creation
    delete "logout" => "users#destroy" # Logout action

    # Set login/signup page as the root
    root "users#new"



    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    get "cart", to: "cart#show", as: "cart"
    get 'order_success', to: 'checkouts#success'


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"w"
end
