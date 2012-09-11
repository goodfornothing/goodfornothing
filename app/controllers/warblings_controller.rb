class WarblingsController < ApplicationController

  before_filter :fetch_warblings

	def index
	  @updates = Post.updates
	end
	
	def show
	  @warbling = Warbling.find(params[:id])
	end
	
	private 
	  def fetch_warblings
	    @warblings = Warbling.all
	  end

end