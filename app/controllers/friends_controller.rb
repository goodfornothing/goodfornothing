class FriendsController < ApplicationController

	def index
	  @friends = Friend.all.reverse
  end

end
