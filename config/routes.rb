Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :topics
    devise_for :users,
      path: "",
      path_names: {
        sign_in: "login",
        sign_up: "signup"
      },
      controllers: {
        registrations: "users/registrations"
      }
  end

  resources :forums
  resources :users, only: [:show]
  resource :settings, only: [:show, :update]
  resources :categories
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "categories#index"
end
