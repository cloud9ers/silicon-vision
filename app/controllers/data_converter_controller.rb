class DataConverterController < ApplicationController
  def index
  end

  def request_datasheet
    begin
      DatasheetsMailer.email_message(params["request"]).deliver
      render :json=>{:success=> true, :msg=> 'Your request has been submitted'}
    rescue
      render :json=>{:success=> false, :msg=> 'An Error occurred please try again later'}
    end
  end

end