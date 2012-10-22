class MembersController < ApplicationController

	def index
	  
	  @chapter_members = []
	  
	  if user_signed_in?
	   
	    if current_user.chapter.present?
	      @chapter_members = current_user.chapter.users.active
	      @members = User.active.where('chapter_id != ? or chapter_id IS NULL', current_user.chapter.id)
	    else
	      @members = User.active
	    end
	    
  	  @member_reach = current_user.member_reach
	  else
	    @members = User.active
	    @member_reach = []
	  end
	  
  end
  
  def show
    
    @member = User.active.find(params[:id])
    
    if @member.nil?
      not_found
    else
      @first_sign_in = (user_signed_in? && params[:welcome].present? && current_user == @member) ? true : false
      @gig = (params[:gig].present?) ? Gig.find(params[:gig]) : nil
      @completion = @member.profile_completion					
    end
		
  end

end
