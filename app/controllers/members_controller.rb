class MembersController < ApplicationController

	def index
	  @members = User.all
  end
  
  def show
    @member = User.find(params[:id])
  end

end
