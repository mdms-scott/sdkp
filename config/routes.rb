Sdkp::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get "static/home"
  get "panel/control"
  
  resources :members
  resources :items
  resources :users
  resources :sessions

  root :to => "static#home"
end
