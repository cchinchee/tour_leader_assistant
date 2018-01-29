Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
  get 'cities/:state', to: 'application#cities'
  post "/users/login" => "users#login", as: "users_login"
  
  get "/users/log_out" => "users#logout", as: "users_logout"
  resources :users
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/tours/all_tour" => "tours#all_tour", as: "tours_all_tour"
  resources :tours
  
end
