class BriefsController < ApplicationController

	def show
		@brief = Brief.find(params[:id])
	end
	
	def join
	  # if not already 'attending' this brief's gig, add user to generic slot
	end

end
