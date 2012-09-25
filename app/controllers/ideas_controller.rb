class IdeasController < ApplicationController
  
  before_filter :fetch_challenge
  before_filter :fetch_idea, :only => [:edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :authenticate_as_owner!, :only => [:destroy, :edit, :update]
  
  def create
    
    @idea = Idea.new(params[:idea])
    @idea.challenge = @challenge
    @idea.user = current_user
    
    if @idea.save
      if request.xhr?
        render :create, :format => "js"
      else
        redirect_to @challenge
      end
    else      
      if request.xhr?
        render :json => { :status => 500, :data => { :message => "Your idea could not be saved" } }
      else
        flash[:notice] = "Sorry, we couldn't save your idea"
        redirect_to @challenge
      end
    end
    
  end
  
  def edit
  end
  
  def update
    if @idea.update_attributes(params[:idea])
      redirect_to "#{challenge_path(@challenge)}#contributions"
    else
      render :edit
    end
  end
  
  def destroy
    @idea.destroy
    redirect_to "#{challenge_path(@challenge)}#contributions"
  end
  
  protected
  
    def fetch_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end
    
    def fetch_idea
      @idea = Idea.find(params[:id])
    end
    
    def authenticate_as_owner!
      unless signed_in_as_owner?(@idea)
        flash[:error] = "You can not edit other people's ideas"
        redirect_to challenge_path(@challenge)
      end
    end
  
end