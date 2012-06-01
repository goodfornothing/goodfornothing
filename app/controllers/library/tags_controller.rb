class Library::TagsController < ApplicationController

	def show
		@tag = Library::Tag.find(params[:id])
		@tags = Library::Tag.all
	end

end
