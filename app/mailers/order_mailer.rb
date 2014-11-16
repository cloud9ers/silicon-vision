class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    mail(:from => @order.email, :to => Rails.application.config.demo_orders_receiver_address, :subject => "Message from user #{@order.name} <#{@order.email}>", :content_type => "text/html")
    Rails.logger.info {"ContactMailer sent a message from address #{@order.email} to address #{Rails.application.config.demo_orders_receiver_address}"}
  end
end
