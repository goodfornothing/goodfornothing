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
	  @issues = Issue.active
  	@issue = Issue.find(params[:id]) if params[:id]
  	@open_challenges = (@issue) ? @issue.challenges.activated : Challenge.activated.reverse
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
