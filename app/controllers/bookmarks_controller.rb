class BookmarksController < ApplicationController

	def index
	  page = params[:page] || 1
  	@bookmarks = Bookmark.order("created_at DESC").where("published = true").page(page)
	end

	def search
	  @bookmarks = Bookmark.where('title like ?',"%#{params[:term]}%").where("published = true")
	end

end
