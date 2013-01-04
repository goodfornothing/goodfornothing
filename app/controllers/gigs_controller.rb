class GigsController < ApplicationController

  respond_to :html
  
  before_filter :fetch_gig, :only => [:show]

	def index
	  @chapter = Chapter.find(params[:id]) if params[:id]
	  @past_gigs = (@chapter) ? Gig.where('start_time < ? and chapter_id = ?', Date.today, @chapter.id).order('start_time DESC') : Gig.where('start_time < ?', Date.today).order('start_time DESC')
	end

	def show
	  
	  # FriendlyID History
    if request.path != gig_path(@gig)
      return redirect_to @gig, :status => :moved_permanently
    end
	  
	end
	
	private
	  
	  def fetch_gig
	    @gig = Gig.find(params[:id])
	  end

end
