class BookmarksController < ApplicationController

  before_filter :fetch_tags

	def index
	  page = params[:page] || 1
	  
	  @tag = Tag.find(params[:id]) if params[:id]
	  
  	@bookmarks = (@tag) ? @tag.bookmarks.order("created_at DESC").where("published = true").page(page) : Bookmark.order("created_at DESC").where("published = true").page(page)
	end

	def search
	  @bookmarks = Bookmark.where('title like ?',"%#{params[:term]}%").where("published = true")
	  render "index"
	end
	
	protected 
	
	  def fetch_tags 
	    @tags = Tag.all
	  end

end
