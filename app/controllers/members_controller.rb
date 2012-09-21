class MembersController < ApplicationController

	def index
	  
	  @chapter_members = []
	  
	  if user_signed_in?
	   
	    if current_user.chapter.present?
	      @chapter_members = current_user.chapter.users.active
	      @members = User.active.where('chapter_id != ?', current_user.chapter.id)
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
