require "hominid"
class NewslettersController < ApplicationController
  def subscribe
    begin
      homi = Hominid::API.new(Rails.application.config.mail_chimp_api_key)
      subscriber = params[:user][:address]
      Rails.logger.debug {"subscription to newsletter has been requested by email #{subscriber}"}
      list_id = homi.lists["data"].first["id"]
      Rails.logger.debug {"subscribing to mailing list #{list_id}"}
      resp = homi.list_subscribe(list_id, subscriber, :email_type => 'html')
      @hide_form = true
      @suceed_message = t(:successful_subscription)
      @error = nil
      Rails.logger.info {"A confirmation to newsletter subscription has been sent to address #{subscriber}"}
    rescue Hominid::APIError => e
      @suceed_message = nil
      if e.message.start_with? "<502>"
        Rails.logger.error {"#{subscriber} is an invalid email address"}
        @error = t(:invalid_address)

      elsif e.message.start_with? "<214>"
        Rails.logger.error {"User #{subscriber} is already subscribed"}
        @error = t(:already_registered)

      end
     rescue Exception => e
        Rails.logger.error {"Subscription failed for user #{subscriber}"}
        @error = t(:failed_subscription) 
    end
  
    respond_to do |format|
    format.html {render "static/contact"}
    format.json {render :json=>{:success=>@suceed_message, :error=>@error} }
    end
  end
  

end