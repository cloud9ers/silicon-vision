SiliconVesion::Application.routes.draw do
  root :to => "home#index"
  match ':action' => 'home#:action'
  match 'ips/:controller/:action' => ':controller#:action' 
  
end