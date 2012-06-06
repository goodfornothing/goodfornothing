class HomeController < ApplicationController

	def index
	  @posts = Blog::Post.order("created_at DESC").limit(5)
	  @gig = Gig.first
  end

end
