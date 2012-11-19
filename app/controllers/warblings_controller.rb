class WarblingsController < ApplicationController

  before_filter :fetch_issues

	def index
		@warblers = User.warblers + User.admins + User.leaders
	  @updates = Post.updates.published.order("created_at DESC").limit(3)
	end
	
	def show
	  @issue = Issue.find(params[:id])
	  # FriendlyID History
    if request.path != warbling_path(@issue)
      return redirect_to @issue, :status => :moved_permanently
    end
	  @stream = @issue.warbles
	end
	
	private 
	  def fetch_issues
	    @issues = Issue.all
	  end

end