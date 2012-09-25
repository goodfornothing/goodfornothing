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
      if request.xhr?
        render :create, :format => "js"
      else
        redirect_to @challenge
      end
    else      
      if request.xhr?
        render :json => { :status => 500, :data => { :message => "Your contribution could not be saved" } }
      else
        flash[:notice] = "Sorry, we couldn't save your contribution"
        redirect_to @challenge
      end
    end
    
  end
  
  def edit
  end
  
  def update
    if @contribution.update_attributes(params[:contribution])
      redirect_to "#{challenge_path(@challenge)}#contributions"
    else
      render :edit
    end
  end
  
  def destroy
    @contribution.destroy
    redirect_to "#{challenge_path(@challenge)}#contributions"
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