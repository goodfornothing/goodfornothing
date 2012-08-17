class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
	end
	
	def index
	  @challenges = Challenge.all
	end
	
	def join
	  # if not already 'attending' this brief's gig, add user to generic slot
	end

end
