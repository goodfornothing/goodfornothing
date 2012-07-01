class Conversation::BookmarksController < ApplicationController

	def index
	  page = params[:page] || 1
	  
		@tag = Conversation::Tag.find(params[:id]) if params[:id]

	  if @tag
	    @bookmarks = @tag.bookmarks		
	  else
  		@bookmarks = Conversation::Bookmark.order("created_at DESC").where("published = true").page(page)
		end
		
		@tags = Conversation::Tag.all
	end

	def search
	  @bookmarks = Conversation::Bookmark.where('title like ?',"%#{params[:term]}%").where("published = true")
	  @tags = Conversation::Tag.all
	end

end
