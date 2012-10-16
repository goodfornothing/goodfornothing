class ChallengesController < ApplicationController

  before_filter :authenticate_user!, :only => :subscribe

	def show
		  
		@challenge = Challenge.find(params[:id])
		
		# FriendlyID History
    if request.path != challenge_path(@challenge)
      return redirect_to @challenge, :status => :moved_permanently
    end
		
		if @challenge.nil?
		  not_found
		end
		
		@contribution = Contribution.new
		@user_content = (@challenge.contributions + @challenge.comments).sort_by(&:created_at).reverse
		
	end
	
	def index
	  @issues = Issue.all
  	@issue = Issue.find(params[:id]) if params[:id]
  	@open_challenges = (@issue) ? @issue.challenges.opened : Challenge.opened.reverse
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
	
	def subscribe	
		
		@challenge = Challenge.find(params[:id])

	  if @challenge.users.include?(current_user)
      @challenge.users.delete(current_user)
      flash[:notice] = "You are no longer subscribed to this challenge."
    else
      @challenge.users << current_user
    end

    redirect_to challenge_path(@challenge)
		
	end

end
