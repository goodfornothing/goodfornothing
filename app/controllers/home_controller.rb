class HomeController < ApplicationController

	def index
	  @posts = Blog::Post.order("created_at DESC").limit(3)
	  @gig = Gig.first
  end

end
