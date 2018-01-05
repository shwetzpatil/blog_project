class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_search_and_subscribe_obj

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to main_app.root_url, alert: exception.message
    end

    def set_search_and_subscribe_obj 
      @search_article_obj = Article.new
      @subscribe_obj = Subscribe.new
    end
end
