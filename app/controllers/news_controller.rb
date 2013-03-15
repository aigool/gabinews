class NewsController < ApplicationController

 def index
   if params[:id]
     @news = News.find(params[:id])
   end
 end
end
