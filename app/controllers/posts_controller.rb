class PostsController < ApplicationController

  def show
	  @warblings = Warbling.all
		@post = Post.find(params[:id])
	end

end
