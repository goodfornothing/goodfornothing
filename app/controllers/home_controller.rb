class HomeController < ApplicationController

	def index
	  @posts = Blog::Post.order("created_at DESC").limit(4)
	  @gig = Gig.first
	  @categories = Blog::Category.all
  end

end
