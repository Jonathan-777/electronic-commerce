Rails.application.routes.draw do
  namespace :admin do
    devise_for :admins, path: "admin", controllers: {
      sessions: "admin/sessions"
    }
    resources :dashboard
  end

  # Devise routes with explicit path
  devise_for :users, path: "auth", controllers: {
    sessions: "auth/sessions",
    registrations: "auth/registrations"
  }

  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end

  # Add constraints to users resource
  resources :users, constraints: { id: /\d+/ }  # Only allow numeric IDs

  get "home", to: "home#index", as: :home
  get "layouts", to: "layouts#index"

  namespace :admin do
    resources :users do
      resources :user_data
    end
  end

  get "up", to: "rails/health#show", as: :rails_health_check
end
