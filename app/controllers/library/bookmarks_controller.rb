class Library::BookmarksController < ApplicationController

	def index
		@bookmarks = Library::Bookmark.order("created_at DESC").where("published = 1")
		@tags = Library::Tag.all
	end

	def search
	  @bookmarks = Library::Bookmark.where('title like ?',"%#{params[:term]}%").where("published = 1")
	  @tags = Library::Tag.all
	end

end
