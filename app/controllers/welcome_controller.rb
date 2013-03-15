class WelcomeController < ApplicationController
  def index
  end

  def index
    @newslist = News.order('rating' || 'created_at').reverse
    #@newsusers = @newslist.map{ |elem| elem elem.user=Users.find(elem.user).name }


#    for $u in (@newslist)
#      $us = Users.find($u.user)
#      new $u.user = '7'
#    end

    #@users.map! { |elem| Users.find(elem) } 
    #@users.map! { |elem| elem.name } 

    #  select $_.user
    #end

    #Model.find(primary_key, options = nil),
  end

  def authorization
    if params[:mail] && params[:password]
      @result = 1
    end
  end

end
