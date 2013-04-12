class CommunityController < ApplicationController
	include CommunityHelper

  def show

  end

def communitycreate
        checkuser
 	   	@userid= session[:user_id]
	  	@CommunityName=params[:CommunityName]
	  	@CommunityDesc=params[:CommunityDesc]
       @Community=Community.create :UserID => @userid, :CommunityName => @CommunityName, :CommunityDesc => @CommunityDesc

       if @Community.save
       
       redirect_to(community_path)
      end
end
 def Community
    if(checkuser)
      @Community= Community.where(:userid => session[:user_id])
      render "Community" 		
 	else
 	  redirect_to log_in_path 
	end
  end  
end

