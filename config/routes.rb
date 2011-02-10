Sdkp::Application.routes.draw do
  get "home/index"
  
  resources :members
  resources :items

  root :to => "home#index"
end
