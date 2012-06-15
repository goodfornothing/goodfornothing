class Blog::PostsController < ApplicationController

  before_filter :fetch_categories

	def index
		
		@category = Blog::Category.find_by_title(params[:category]) if params[:category]

	  if @category
	    @posts = Blog::Post.order("created_at DESC").find_all_by_category_id(@category.id)  		
	  else
		  @posts = Blog::Post.order("created_at DESC").all
		end
		
		respond_to do |format|
      format.html { render :layout => true }
      format.rss { 
        @posts = @posts
        render :layout => false 
      } 
    end
		
	end

	def show
		@post = Blog::Post.find(params[:id])
	end
	
	private
	  def fetch_categories
	    @categories = Blog::Category.all
	  end

end
