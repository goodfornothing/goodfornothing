class Conversation::TagsController < ApplicationController

	def show
		@tag = Conversation::Tag.find(params[:id])
		@tags = Conversation::Tag.all
	end

end
