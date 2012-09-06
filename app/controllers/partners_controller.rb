class PartnersController < ApplicationController

	def index
	  @partners = Partner.all
  end
  
	def new
	  @partner = Partner.new
	end
	
	def create
	  # set 'active' = false
	  # email notification to admins
	end

end
