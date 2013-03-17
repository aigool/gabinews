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


  def mynews
    @auth = 1
    @user = 1 #TODO
    @mynews = []
    
    @newslist = News.order('rating' || 'created_at').reverse
    #@newsusers = @newslist.map{ |elem| elem elem.user=Users.find(elem.user).name }


    for $u in (@newslist)
      $us = Users.find($u.user)
      if $u.user == @user
        @mynews[@mynews.size] = $u
      end
    end
  end

  def authorization
    if params[:mail] && params[:password]
      @result = 1
    end
  end

  def edit_news
    if params[:id]
      @news = News.find(params[:id])
    end
  end

  def delete
    News.destroy(params[:id])
    redirect_to :controller => 'welcome', :action => 'mynews'
  end


  def create
    if params[:user] != nil && params[:text] != nil && params[:title] != nil
      @po = News.new
      @po.user = params[:user]
      @po.text = params[:text]
      @po.title = params[:title]
      @result = "can't add"
      if @po.save
        @result = 'added'
      end
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end


  def edit
    if params[:id] != nil && params[:text] != nil && params[:title] != nil
      @po = News.find(params[:id])
      #@po.text = params[:text]
      #@po.title = params[:title]

      @result = "can't edit"
      if @po.update_attributes(text: params[:text], title: params[:title])
        @result = 'edited'
      end
      redirect_to :controller => 'welcome', :action => 'mynews'
    end
  end


end
