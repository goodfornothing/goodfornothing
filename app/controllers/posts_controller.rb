class PostsController < ApplicationController

  before_filter :fetch_warblings

  def show
		@post = Post.find(params[:id])
	end
	
	def index
	  @updates = Post.updates.order("created_at DESC")
	end
	
	private 
	
	  def fetch_warblings
	    @warblings = Warbling.all
	  end

end
