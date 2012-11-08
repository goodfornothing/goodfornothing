class CommentsController < ApplicationController
  
  before_filter :fetch_commentable
  before_filter :fetch_comment, :only => [:edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :authenticate_as_owner!, :only => [:destroy, :edit, :update]
  
  def create
    
	  @comment = @commentable.comments.build(params[:comment])
		@comment.user = current_user
    
    if @comment.save
			AdminMailer.new_comment(@comment).deliver
      if request.xhr?
        render :create, :format => "js"
      else
        redirect_to [@commentable]
      end
    else      
      if request.xhr?
        render :json => { :status => 500, :data => { :message => "Your comment could not be saved" } }
      else
        flash[:notice] = "Sorry, we couldn't save your comment"
        redirect_to [@commentable]
      end
    end
    
  end
  
  def edit
  end
  
  def update
    if @comment.update_attributes(params[:comment])
      redirect_to [@commentable]
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to [@commentable]
  end
  
  protected
  
    def fetch_comment
      @comment = Comment.find(params[:id])
    end

		def find_commentable
		  params.each do |name, value|
		    if name =~ /(.+)_id$/
		      return $1.classify.constantize.find(value)
		    end
		  end
		  nil
		end
		
		def fetch_commentable
      @commentable = find_commentable
    end
    
    def authenticate_as_owner!
      unless signed_in_as_owner?(@comment)
        flash[:error] = "You can not edit other people's comments"
        redirect_to [@commentable]
      end
    end
  
end