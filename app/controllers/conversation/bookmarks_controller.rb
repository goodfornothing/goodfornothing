class Conversation::BookmarksController < ApplicationController

	def index
	  page = params[:page] || 1
		@bookmarks = Conversation::Bookmark.order("created_at DESC").where("published = true").page(page)
		@tags = Conversation::Tag.all
	end

	def search
	  @bookmarks = Conversation::Bookmark.where('title like ?',"%#{params[:term]}%").where("published = true")
	  @tags = Conversation::Tag.all
	end

end
