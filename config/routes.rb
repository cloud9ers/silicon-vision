SiliconVesion::Application.routes.draw do
  devise_for :users
  resources :users
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  match ':action' => 'home#:action'
  match 'ips/:controller/:action' => ':controller#:action' 
  
end