class WarblingsController < ApplicationController

  before_filter :fetch_warblings

	def index
	end
	
	def show
	  @warbling = Warbling.find(params[:id])
	end
	
	private 
	  def fetch_warblings
	    @warblings = Warbling.all
	  end

end