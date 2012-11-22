class PostsController < ApplicationController

  before_filter :fetch_issues

  def show
		
		if params[:id] == "stuff-that-happened-at-northernsoul-good-for-nothing-in-manchester"
			return redirect_to post_path('good-for-nothing-mission-2013')
		end
		
		@post = Post.find(params[:id])
		
		# FriendlyID History
    if request.path != post_path(@post)
      return redirect_to @post, :status => :moved_permanently
    end
		
	end
	
	def index
	  @updates = Post.updates.published.order("created_at DESC")
	end
	
	private 
	
	  def fetch_issues
	    @issues = Issue.active
	  end

end
