class WarblingsController < ApplicationController

	def index
		@warblers = User.warblers + User.admins + User.leaders
	  @updates = Post.updates.published.order("created_at DESC").limit(3)
		@issues = Issue.active
	end
	
	def show
		
		if params[:id] == "food"
			return redirect_to warbling_path('sustainable-food') 
		end

	  @issue = Issue.find(params[:id])
	
	  # FriendlyID History
    if request.path != warbling_path(@issue)
      return redirect_to @issue, :status => :moved_permanently
    end

	  @stream = @issue.warbles
		@issues = Issue.active.where('id != ?', @issue.id)
		
	end
	
	def author

	  @author = User.find(params[:id])
	
	  # FriendlyID History
    if request.path != warblings_author_path(@author)
      return redirect_to warblings_author_path(@author), :status => :moved_permanently
    end

	  @stream = @author.warbles
		@issues = Issue.active
		
	end

end