class NewsController < ApplicationController

  def index
    @newslist = News.order('rating').reverse
  end
end
