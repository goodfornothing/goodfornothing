class ColophonController < ApplicationController

	def about
	  @chapters = Chapter.all
	end

	def community
	  @friends = Friend.all
	  @members = User.all
	  @ventures = Venture.all
	  @partners = Partner.all
	end

end