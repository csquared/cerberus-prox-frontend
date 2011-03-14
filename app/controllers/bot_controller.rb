class Bot < ApplicationController
  
  def index
    render :text => params[:message]
  end
end
