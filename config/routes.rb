SiliconVesion::Application.routes.draw do

  root :to => "home#index"

  scope "(:locale)", locale: /en|ch|ja/ do
    get '/' => "home#index"
    get "news/index"

    match "/newsletters/subscribe" => "newsletters#subscribe"
    match "aj/datasheets/request"  => "dataConverter#request_datasheet" , :method => "POST"

    get '/demos/order' => 'main_products#order_demo'
    post '/demos/order' => 'main_products#create_order'

    match ':action' => 'home#:action'
    match '/sivi-media/:media_name' => 'news#index'
    # match 'ips/:controller/:action' => ':controller#:action'

    match ':controller/:action' => ':controller#:action'
  end
end
