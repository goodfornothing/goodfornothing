class PagesController < ApplicationController

	load_and_authorize_resource

	def show
		
		@page = Page.find(params[:id])
		
		# FriendlyID History
    if request.path != page_path(@page)
      return redirect_to @page, :status => :moved_permanently
    end
		
		@pages = Page.features
		
	end
	
	def index
		
		@pages = Page.features
		
		if params[:i_want_to_start_doing_already]
			cookies.permanent[:i_want_to_start_doing_already] = true
		end
		
	end

end