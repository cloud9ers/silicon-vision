class DataConverterController < ApplicationController
  def index
    @users = User.all
  end

end
