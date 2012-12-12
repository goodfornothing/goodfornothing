class PagesController < ApplicationController

	load_and_authorize_resource

	def show
		
		@page = Page.find(params[:id])
		
		# FriendlyID History
    if request.path != page_path(@page)
      return redirect_to @page, :status => :moved_permanently
    end
		
		if @page.nil?
			return not_found
		end
		
		@pages = Page.all
		
	end
	
	def index
		@pages = Page.features
	end

end