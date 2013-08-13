class HomeController < ApplicationController
  def index
  end

  def about
  end

  def ips
  end

  def applications
  end
  
  define_method('sivi-media') do
  end
  
  def careers
  end
  
  def contact
    if request.post?
      Rails.logger.debug {"User #{params["user"]["name"]} is sending a message"}
      user = {:name=>params["user"]["name"], :email=>params["user"]["email"]}
      msg = params["message"]
      begin
        ContactMailer.email_message(user, msg).deliver
        flash.now[:notice] = "Message Sent"
        Rails.logger.info {"User #{params["user"]["name"]} sent a message"}
      rescue
        flash.now[:error] = "Problem with sending the message"
        Rails.logger.error {"User #{params["user"]["name"]} encountered a problem when sending a message"}
      end
    end
  end
  
end
