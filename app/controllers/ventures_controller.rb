class VenturesController < ApplicationController

	def index
	  @ventures = Venture.all
  end

end
