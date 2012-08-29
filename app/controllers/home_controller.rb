class HomeController < ApplicationController

	def index
	  
	  @warblings = Warbling.order("created_at DESC").limit(3)
	  @gig = Gig.order("start_time DESC").first
	  
	  @member_count = User.count
	  @cause_count = Venture.count + Partner.count
	  
  end

end
