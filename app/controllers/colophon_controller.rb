class ColophonController < ApplicationController

	def about
	  @chapters = Chapter.all
	end
	
	def how
	  
	end

	def community
	  @friends = Friend.limit(4)
	  @members = User.limit(4)
	  @ventures = Venture.limit(4)
	  @partners = Partner.limit(4)
	end
	
	def conversation
	  @categories = Conversation::Category.all
	  @tags = Conversation::Tag.all
	end

end