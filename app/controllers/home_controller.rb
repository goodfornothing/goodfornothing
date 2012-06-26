class HomeController < ApplicationController

	def index
	  @posts = Blog::Post.order("created_at DESC").limit(1)
	  @gig = Gig.order("start_time DESC").first
	  @categories = Conversation::Category.all
  end

end
