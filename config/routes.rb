Sdkp::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"

  get "static/home"
  get "panel/control"
  
  match 'members/:id/move_up_list', :to => 'members#move_up_list', :as => 'move_up_list'
  match 'members/:id/move_down_list', :to => 'members#move_down_list', :as => 'move_down_list'
  
  resources :members
  resources :items
  resources :users
  resources :sessions

  root :to => "static#home"
end
