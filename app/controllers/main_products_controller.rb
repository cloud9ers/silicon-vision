class MainProductsController < ApplicationController

  layout 'main_products_layout'

  def index
  end

  def bluetooth_low_energy
  end

  def order_demo
    @order= Order.new
  end

  def create_order
    @order = Order.new(params[:order])

    begin
      OrderMailer.order_email(@order).deliver
      flash[:notice] = "Message Sent!"
      Rails.logger.info {"User #{params["order"]["name"]} sent a message"}
      redirect_to(demos_order_path)
    rescue Exception => e
      flash.now[:error] = "Problem with sending the message"
      Rails.logger.error {"User #{params["order"]["name"]} encountered a problem (#{e}) when sending a message"}
      render :action => 'order_demo'
    end
  end

  def updates
  end

  def partners
  end

end
