class ContactMailer < ActionMailer::Base
  default from: Rails.application.config.receiver_address
  def email_message(user, msg)
    @user = user
    @msg = msg
    mail(:to => Rails.application.config.receiver_address, :subject => "Message from user #{@user[:name]} <#{@user[:email]}>", :content_type => "text/html",)
    Rails.logger.info {"ContactMailer sent a message from address #{@user[:email]} to address #{Rails.application.config.receiver_address}"}
  end
end
