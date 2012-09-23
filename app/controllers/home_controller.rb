class HomeController < ApplicationController

	def index
	  
	  @update = Post.order("created_at DESC").first
	  @challenge = Challenge.active.find_by_featured(true)
	  
	  @member_count = User.count
	  @venture_count = Venture.count
	  
	  if user_signed_in? && current_user.chapter.present?
	    @social = Social.where('start_time > ? && chapter_id = ?',Time.now, current_user.chapter.id).order("start_time ASC").first
	    @gig = Gig.where('end_time > ? && chapter_id = ?',Time.now, current_user.chapter.id).order("start_time ASC").first
	  end
	  
	  @social = Social.where('start_time > ?',Time.now).order("start_time ASC").first if !user_signed_in? or @social.nil?
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time ASC").first if !user_signed_in? or @gig.nil?
	  
  end

end
