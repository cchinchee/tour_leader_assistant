Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"

  post "/users/login" => "users#login", as: "users_login"
  
  get "/users/log_out" => "users#logout", as: "users_logout"
  resources :users
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  resources :tours
  
end
