class DatasheetsMailer < ActionMailer::Base
  def email_message(request)
    @request = request
    mail(:from => @request[:email], :to => Rails.application.config.datasheets_receiver_address, :subject => "Data sheet  Request", :content_type => "text/html",)
    Rails.logger.info {"ContactMailer sent a message from address #{@request[:email]} to address #{Rails.application.config.datasheets_receiver_address}"}
  end
end