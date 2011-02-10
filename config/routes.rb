Sdkp::Application.routes.draw do
  get "home/index"
  
  resources :members

  root :to => "home#index"
end
