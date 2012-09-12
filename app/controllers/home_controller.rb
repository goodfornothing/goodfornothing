class HomeController < ApplicationController

	def index
	  
	  @update = Post.updates.order("created_at DESC").first
	  @challenge = Challenge.active.find_by_featured(true)
	  
	  @member_count = User.count
	  @venture_count = Venture.count
	  
	  @social = Social.where('start_time > ?',Time.now).first
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time DESC").first
	  
  end

end
