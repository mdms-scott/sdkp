Sdkp::Application.routes.draw do
  get "static/home"
  
  resources :members
  resources :items

  root :to => "static#home"
end
