class MembersController < ApplicationController

	def index
	  @members = User.all
  end
  
  def show
    @member = User.find_by_slug(params[:id])
  end

end
