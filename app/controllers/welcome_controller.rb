class WelcomeController < ApplicationController
  def index
  end

  def index
    @newslist = News.order('rating' || 'created_at').reverse
  end

  def authorization
    if params[:mail] && params[:password]
      @result = 1
    end
  end

end
