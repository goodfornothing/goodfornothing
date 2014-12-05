class HomeController < ApplicationController

	def index
	  
	  
	  @member_count = User.count
	  @venture_count = Venture.count
	  @event_count = Social.count + Gig.count
	  @chapter_count = Chapter.count
	  
	  @latest_posts = Post.published.order("created_at DESC").take(3)    
	  @social = Social.where('start_time > ?',Time.now).order("start_time ASC").take(6)
	  @gig = Gig.where('end_time > ?',Time.now).order("start_time ASC").take(6)

	  @last_gig = Gig.where('end_time < ?',Time.now).order("start_time ASC").first
    
    @results = (@gig + @social)
	
  end

end
