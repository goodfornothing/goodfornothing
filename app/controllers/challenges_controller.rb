class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
		@idea = Idea.new
		@contribution = Contribution.new
	end
	
	def index
	  @warblings = Warbling.all
  	@warbling = Warbling.find(params[:id]) if params[:id]
  	@open_challenges = (@warbling) ? @warbling.challenges.open : Challenge.open
  	@closed_challenges = (@warbling) ? @warbling.challenges.closed : Challenge.closed	
	end
	
	def new
	  @challenge = Challenge.new
	end
	
	def create
	  
	  @challenge = Challenge.new(params[:challenge])
	  @challenge.active = false
    	
    if @challenge.save
      AdminMailer.new_challenge(@challenge).deliver
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
