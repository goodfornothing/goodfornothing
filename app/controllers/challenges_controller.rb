class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
	end
	
	def index
	  @challenges = Challenge.all
	end

end
