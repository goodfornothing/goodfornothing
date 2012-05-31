class Blog::PostsController < ApplicationController

	def index
		@posts = Blog::Post.order("created_at DESC").all
	end

	def show
		@post = Blog::Post.find(params[:id])
	end

end
