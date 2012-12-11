class PagesController < ApplicationController

	load_and_authorize_resource

	def show
		
		@page = Page.find(params[:id])
		
		# FriendlyID History
    if request.path != wiki_page_path(@page)
      return redirect_to @page, :status => :moved_permanently
    end
		
		if @page.nil?
			return not_found
		end
		
		@pages = Page.all
		
	end
	
	def index
		@pages = Page.all
	end

end