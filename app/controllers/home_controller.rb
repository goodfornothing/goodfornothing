class HomeController < ApplicationController

	def index
	  
	  @update = Post.order("created_at DESC").first
	  @challenge = Challenge.activated.find_by_featured(true)
	  
	  @member_count = User.count
	  @venture_count = Venture.count
	  
		@social = Social.feature.first
			
	  if user_signed_in? && current_user.chapter.present?
	    @social = Social.where('start_time > ? && chapter_id = ?',Time.now, current_user.chapter.id).order("start_time ASC").first if @social.nil?
	    @gig = Gig.where('end_time > ? && chapter_id = ?',Time.now, current_user.chapter.id).order("start_time ASC").first
	  end
	  
	  @social = Social.where('start_time > ?',Time.now).order("start_time ASC").first if !user_signed_in? and @social.nil?
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time ASC").first if !user_signed_in? or @gig.nil?
	
  end

end
