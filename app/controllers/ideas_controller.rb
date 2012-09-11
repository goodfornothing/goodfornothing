class IdeasController < ApplicationController
  
  before_filter :fetch_challenge
  before_filter :fetch_idea, :only => [:edit, :update]
  before_filter :authenticate_user!
  
  def create
    
    @idea = Idea.new(params[:idea])
    @idea.challenge = @challenge
    @idea.user = current_user
    
    if @idea.save
      redirect_to @challenge
    else
      flash[:notice] = "Sorry, we couldn't save your idea"
      redirect_to @challenge
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @idea.update_attributes(params[:idea])
      redirect_to @challenge
    else
      render :edit
    end
  end
  
  protected
  
    def fetch_challenge
      @challenge = Challenge.find(params[:id])
    end
    
    def fetch_idea
      @idea = Idea.find(params[:idea_id])
    end
  
end