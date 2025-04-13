Rails.application.routes.draw do
    root "home#index"

    devise_for :admins, path: 'admin', controllers: {
      sessions: 'admin/dashboard'

    }
    namespace :admin do
        resources :dashboard
        resources :admins, only: [:index, :edit, :update]
        get 'sign_up', to: 'registrations#new'
        post 'sign_up', to: 'registrations#create'
    end

     # devise_for :users  

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    devise_for :users, path: 'auth', controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations'
    }
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end


    get "home" => "home#index", as: :home
    get "layouts" => "layouts#index"
    resources :users

    # Define authentication routes
    get "login" => "users#new"  # Login page (signup form)


    post "login" => "users#create" # Handles user creation
    delete "logout" => "users#destroy" # Logout action

    # Set login/signup page as the root
    # root "users#new"

    # # Add namespace for admin         # alternate implementation (not currently used)
    # namespace :admin do
    #   resources :users do
    #     resources :user_data
    #   end
    # end

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get "up" => "rails/health#show", as: :rails_health_check

    # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
    # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
    # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

    # Defines the root path route ("/")
    # root "posts#index"w"
end
