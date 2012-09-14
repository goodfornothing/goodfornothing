class MembersController < ApplicationController

	def index
	  
	  @members = User.active
	  @chapter_members = (user_signed_in? && current_user.chapter.present?) ? current_user.chapter.users.active : []
	  @member_reach = (user_signed_in?) ? current_user.member_reach : []
	  
  end
  
  def show
    @member = User.active.find(params[:id])
    @first_sign_in = (user_signed_in? && params[:welcome].present? && current_user == @member) ? true : false
  end

end
