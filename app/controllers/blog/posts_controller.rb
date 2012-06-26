class Blog::PostsController < ApplicationController

  before_filter :fetch_categories

	def index
		
		page = params[:page] || 1
		
		@category = Conversation::Category.find_by_title(params[:category]) if params[:category]
    @bookmarks = Library::Bookmark.where('published = true').limit(3)

	  if @category
	    @posts = Blog::Post.order("created_at DESC").where('category_id = ?',@category.id).page(page) 		
	  else
		  @posts = Blog::Post.order("created_at DESC").page(page)
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
	    @categories = Conversation::Category.all
	  end

end
