SiliconVesion::Application.routes.draw do

  root :to => "home#index"
  get '/:locale' => "home#index"

  scope "(:locale)", locale: /en|nl/ do
    get "news/index"

    match "/newsletters/subscribe" => "newsletters#subscribe"
    match "aj/datasheets/request"  => "dataConverter#request_datasheet" , :method => "POST"
    match ':action' => 'home#:action'
    match '/sivi-media/:media_name' => 'news#index'
    # match 'ips/:controller/:action' => ':controller#:action'
    match ':controller/:action' => ':controller#:action'
  end
end
