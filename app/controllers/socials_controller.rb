class SocialsController < ApplicationController

  respond_to :html
  
  before_filter :fetch_social, :only => [:show]

	def show
	  
	  # FriendlyID History
    if request.path != social_path(@social)
      return redirect_to @social, :status => :moved_permanently
    end

	end
		
	private
	
	  def fetch_social
	    @social = Social.find(params[:id])
			if @social.nil?
	      not_found
	    end
	  end

end
