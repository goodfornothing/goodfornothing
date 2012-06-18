class Library::BookmarksController < ApplicationController

	def index
	  page = params[:page] || 1
		@bookmarks = Library::Bookmark.order("created_at DESC").where("published = 1").page(page)
		@tags = Library::Tag.all
	end

	def search
	  @bookmarks = Library::Bookmark.where('title like ?',"%#{params[:term]}%").where("published = 1")
	  @tags = Library::Tag.all
	end

end
