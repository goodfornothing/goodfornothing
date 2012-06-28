class MembersController < ApplicationController

	def index
	  @members = User.all
  end
  
  def show
    @member = User.find_by_name(params[:slug].gsub('-',' '))
  end

end
