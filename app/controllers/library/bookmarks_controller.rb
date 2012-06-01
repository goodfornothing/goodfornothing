class Library::BookmarksController < ApplicationController

	def index
		@bookmarks = Library::Bookmark.order("created_at DESC").all
		@tags = Library::Tag.all
	end

	def search
	  @bookmarks = Library::Bookmark.where('title like ?',"%#{params[:term]}%").all
	  @tags = Library::Tag.all
	end

end
