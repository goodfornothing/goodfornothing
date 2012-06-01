class GigsController < ApplicationController

  before_filter :fetch_regions

	def index
	    
	  @region = Region.find_by_title(params[:region]) if params[:region]

	  if @region
	    @gigs = Gig.find_all_by_region_id(@region.id)
	  else
		  @gigs = Gig.all
		end
		
	end

	def show
		@gig = Gig.find(params[:id])
	end
	
	private
	  def fetch_regions
      @regions = Region.all
	  end

end
