class PartnersController < ApplicationController

	def index
	  @partners = Partner.active.all
  end

end
