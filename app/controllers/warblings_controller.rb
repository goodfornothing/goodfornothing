class WarblingsController < ApplicationController

  before_filter :fetch_warblings

	def index
	  @updates = Post.updates.order("created_at DESC").limit(1)
	end
	
	def show
	  @warbling = Warbling.find(params[:id])
	  @stream = (@warbling.bookmarks + @warbling.posts).sort_by(&:created_at).reverse
	end
	
	private 
	  def fetch_warblings
	    @warblings = Warbling.all
	  end

end