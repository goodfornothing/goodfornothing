class CommentsController < ApplicationController

	before_filter :authenticate_user!

	def create
	  @commentable = find_commentable
	  @comment = @commentable.comments.build(params[:comment])
		@comment.user = current_user
	  if @comment.save
	    flash[:notice] = "Successfully created comment."
	    if request.xhr?
	      render :create, :format => "js"
	    else
	      redirect_to @commentable
	    end
	  else
	    if request.xhr?
        render :json => { :status => 500, :data => { :message => "Your comment could not be saved" } }
      else
        flash[:notice] = "Sorry, we couldn't save your comment"
        redirect_to @commentable
      end
	  end
	
	end

	private

	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end

end
