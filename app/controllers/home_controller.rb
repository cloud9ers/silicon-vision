class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def about
  end

  def applications
  end
  
  def media
  end
  
  def careers
  end
  
  def contact
  end
  
end
