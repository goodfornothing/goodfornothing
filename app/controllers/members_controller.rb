class MembersController < ApplicationController

	def index
	  
	  if user_signed_in?
	    @members = User.active
	    @chapter_members = (current_user.chapter.present?) ? current_user.chapter.users.active : []
  	  @member_reach = current_user.member_reach
	  else
	    @members = User.active
	    @member_reach = []
	    @chapter_members = []
	  end
	  
  end
  
  def show
    
    @member = User.active.find(params[:id])
    
    if @member.nil?
      
      not_found
      
    else
    
      @first_sign_in = (user_signed_in? && params[:welcome].present? && current_user == @member) ? true : false
    
      @profile = [ 
        @member.name,
        @member.gender,
        @member.avatar.url,
        @member.age,
        @member.location,
        @member.url,
        @member.twitter_handle
      ]
            
      @completion = ( ( @profile.count.to_f - (@profile.count(nil).to_f+@profile.count("")) ) / @profile.count.to_f) * 100
    end
    
    
  end

end
