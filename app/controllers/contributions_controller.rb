class ContributionsController < ApplicationController
  
  before_filter :fetch_challenge
  before_filter :fetch_contribution, :only => [:edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :authenticate_as_owner!, :only => [:destroy, :edit, :update]
  
  def create
    
    @contribution = Contribution.new(params[:contribution])
    @contribution.challenge = @challenge
    @contribution.user = current_user
    
    if @contribution.save
      redirect_to @challenge
    else
      flash[:notice] = "Sorry, we couldn't save your contribution"
      redirect_to @challenge
    end
    
  end
  
  def edit
  end
  
  def update
    if @contribution.update_attributes(params[:contribution])
      redirect_to @challenge
    else
      render :edit
    end
  end
  
  def destroy
    @contribution.destroy
    redirect_to @challenge
  end
  
  protected
  
    def fetch_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end
    
    def fetch_contribution
      @contribution = Contribution.find(params[:id])
    end
    
    def authenticate_as_owner!
      unless signed_in_as_owner?(@contribution)
        flash[:error] = "You can not edit other people's contributions"
        redirect_to challenge_path(@challenge)
      end
    end
  
end