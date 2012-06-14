class FriendsController < ApplicationController

	def index
	  @friends = Friend.all
  end

end
