class MembersController < ApplicationController

	def index
	  
	  if user_signed_in?
	    @members = User.active.where('id != ?', current_user.id)
	    @chapter_members = (current_user.chapter.present?) ? current_user.chapter.users.active.where('id != ?', current_user.id) : []
  	  @member_reach = current_user.member_reach
	  else
	    @members = User.active
	    @member_reach = []
	    @chapter_members = []
	  end
	  
  end
  
  def show
    @member = User.active.find(params[:id])
    @first_sign_in = (user_signed_in? && params[:welcome].present? && current_user == @member) ? true : false
  end

end
