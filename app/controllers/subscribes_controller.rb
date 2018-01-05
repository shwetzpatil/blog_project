class SubscribesController < ApplicationController
  # new action created in application controller
  def new 
  end  

  def index
    @subscribes = Subscribe.all
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    @subscribe.save
    redirect_to articles_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscribe_params
    params.require(:subscribe).permit(:subscriber_name, :email)
  end
end
