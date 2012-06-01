class BriefsController < ApplicationController

	def show
		@brief = Brief.find(params[:id])
	end

end
