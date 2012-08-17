class ColophonController < ApplicationController

	def who
	  @chapters = Chapter.all
	end
	
	def about
	  
	end
	
	def how
	  
	end

	def community
	end
	
	def conversation
	  @categories = Conversation::Category.all
	  @tags = Conversation::Tag.all
	end

end