class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
	end
	
	def index
	  @warblings = Warbling.all
  	@warbling = Warbling.find(params[:id]) if params[:id]
  	@challenges = (@warbling) ? @warbling.challenges.active : Challenge.active
	end
	
	def new
	  @challenge = Challenge.new
	end
	
	def create
	  
	  @challenge = Challenge.new(params[:challenge])
	  @challenge.active = false
    	
    if @challenge.save
      redirect_to thanks_challenges_path
    else
      flash[:notice] = "Sorry, we couldn't save your challenge"
      render "new"
    end
	  
	  # email notification to admins
	  
	end
	
	def thanks
	  
	end

end
