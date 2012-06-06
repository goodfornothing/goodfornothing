class GigsController < ApplicationController

  before_filter :fetch_regions
  before_filter :fetch_gig, :only => [:show, :attend]

	def index
	  @region = Region.find_by_title(params[:region]) if params[:region]
	  @gigs = (@region) ? Gig.find_all_by_region_id(@region.id) : Gig.all
	end

	def show
	end
	
	def attend
	  if @gig.users.include?(current_user)
      @gig.users.delete(current_user)
    else 
      @gig.users << current_user
    end
    redirect_to gig_path(@cause)
	end
	
	private
	  def fetch_regions
      @regions = Region.all
	  end
	  
	  def fetch_gig
	    @gig = Gig.find(params[:id])
	  end

end
