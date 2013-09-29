class NewsController < ApplicationController
  def index
  	render template: 'news_latest/'+params[:media_name]
  end
end
