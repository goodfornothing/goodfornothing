class HomeController < ApplicationController

	def index
	  
	  
	  @member_count = User.count
	  @venture_count = Venture.count
	  @event_count = Social.count + Gig.count
	  @chapter_count = Chapter.count
	  
	  @update = Post.published.order("created_at DESC").take(6)    
	  @social = Social.where('start_time > ?',Time.now).order("start_time ASC").take(6)
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time ASC").take(6)
    
    @results = (@gig + @social)
	
  end

end
