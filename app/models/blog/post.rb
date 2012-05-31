class Blog::Post < ActiveRecord::Base

	self.table_name = 'blog_posts'

	belongs_to :category
	belongs_to :region
	belongs_to :user

	validates :title, :presence => true
	validates :body, :presence => true


end