class MainProductsController < ApplicationController

  layout 'main_products_layout'

  def index
    @message = "Hello, how are you today?"
  end

end
