class HomeController < ApplicationController

	def index
	  
	  @warblings = Warbling.order("created_at DESC").limit(3)
	  @gig = Gig.order("start_time DESC").first
	  @challenge = Challenge.find_by_featured(true)
	  
	  @member_count = User.count
	  @cause_count = Venture.count + Partner.count
	  
  end

end
