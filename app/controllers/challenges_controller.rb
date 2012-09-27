class ChallengesController < ApplicationController

	def show
		@challenge = Challenge.find(params[:id])
		@idea = Idea.new
		@contribution = Contribution.new
		@user_content = (@challenge.contributions + @challenge.ideas).sort_by(&:created_at).reverse
	end
	
	def index
	  @warblings = Warbling.all
  	@warbling = Warbling.find(params[:id]) if params[:id]
  	@open_challenges = (@warbling) ? @warbling.challenges.opened : Challenge.opened.reverse
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
		  
	end
	
	def thanks
	  
	end

end
