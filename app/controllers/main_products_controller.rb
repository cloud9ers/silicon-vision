class MainProductsController < ApplicationController

  layout 'main_products_layout'

  def index
  end

  def bluetooth_low_energy
  end

  def order_demo
    @order = Order.new
  end

  def create_order
    @order = Order.new(params[:order])
  end

  def updates
  end

  def partners
  end

end
