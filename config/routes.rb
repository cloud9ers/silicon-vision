SiliconVesion::Application.routes.draw do
  root :to => "home#index"
  match "/newsletters/subscribe" => "newsletters#subscribe"
  match ':action' => 'home#:action'
  # match 'ips/:controller/:action' => ':controller#:action'
  match ':controller/:action' => ':controller#:action'
end