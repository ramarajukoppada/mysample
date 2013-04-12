class UsersController < ApplicationController
  def new
  @user = User.new
  end

  def create
	  @user = User.new(params[:user])
	  if @user.save
	    redirect_to(log_in_path)#, :notice => "Signed up!"
	  else
	    render "new"
	  end
   end

   def addusers
    checkuser

    @userview=User.where("id != ?", session[:user_id])
   end

   def Community
     checkuser
      @Community= Community.where(:userid => session[:user_id])
     
    end  

   def blog
    checkuser
  	@blog = Blog.new
   end

   def blogview
     checkuser
      @blogview= Blog.where(:userid => session[:user_id])
     
    end  

 
    
    

   def blogcreate
    checkuser
 	   	@userid= session[:user_id]
	  	@title=params[:title]
	  	@post=params[:post]
       @blog=Blog.create :userid => @userid, :title => @title, :post => @post

       if @blog.save
       
       	redirect_to(blog_view_path)
       else
	    render "blog"
	  end

    
   
   end

   def checkuser
      if session[:user_id] == nil
          redirect_to(log_in_path)
      end
   end

end
