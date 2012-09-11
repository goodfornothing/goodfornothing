class MembersController < ApplicationController

	def index
	  
	  @members = User.active
	  
	  @chapter_members = (user_signed_in? && current_user.chapter.present?) ? current_user.chapter.users.active : []
	  
	  @offline_encountered_members = [] 
	  @online_encountered_members = []
	  
	  if user_signed_in?
	    @offline_encountered_members = current_user.offline_encountered
  	  @online_encountered_members = current_user.online_encountered
	  end
	  
  end
  
  def show
    @member = User.active.find(params[:id])
  end

end
