class PartnersController < ApplicationController

	def index
	  @partners = Partner.active.all
  end
  
	def new
	  @partner = Partner.new
	end
	
	def create
	  @partner = Partner.new(params[:partner])
	  @partner.active = false
    	
    if @partner.save
      AdminMailer.new_partner(@partner).deliver
      redirect_to thanks_partners_path
    else
      flash[:notice] = "Sorry, we couldn't save your request"
      render "new"
    end
	  
	end

  def thanks
    
  end

end
