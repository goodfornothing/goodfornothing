class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
	end
	
	def index
	  @warblings = Warbling.all
  	@warbling = Warbling.find(params[:id]) if params[:id]
  	@challenges = (@warbling) ? Challenge.where('warbling_id = ?', @warbling.id) : Challenge.all
	end
	
	def new
	  @challenge = Challenge.new
	end
	
	def create
	  # set 'active' = false
	  # email notification to admins
	end

end
