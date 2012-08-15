class HomeController < ApplicationController

	def index
	  
	  @post = Conversation::Post.order("created_at DESC").first
	  @gig = Gig.order("start_time DESC").first
	  
	  @member_count = User.count
	  @cause_count = Venture.count + Partner.count
	  
  end

end
