SiliconVesion::Application.routes.draw do
  root :to => "home#index"
  match "/newsletters/subscribe" => "newsletters#subscribe"
  match "aj/datasheets/request"  => "dataConverter#request_datasheet" , :method => "POST"
  match ':action' => 'home#:action'
  # match 'ips/:controller/:action' => ':controller#:action'
  match ':controller/:action' => ':controller#:action'
end