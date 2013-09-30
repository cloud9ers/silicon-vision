SiliconVesion::Application.routes.draw do
  get "news/index"

  root :to => "home#index"
  match "/newsletters/subscribe" => "newsletters#subscribe"
  match "aj/datasheets/request"  => "dataConverter#request_datasheet" , :method => "POST"
  match ':action' => 'home#:action'
  match '/sivi-media/:media_name' => 'news#index'
  # match 'ips/:controller/:action' => ':controller#:action'
  match ':controller/:action' => ':controller#:action'
end