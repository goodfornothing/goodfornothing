class ColophonController < ApplicationController

	def who
	  @chapters = Chapter.all
	end
	
	def about
	end

	def community
	end

end