class Blog::Post < ActiveRecord::Base

	self.table_name = 'blog_posts'

	belongs_to :category
	belongs_to :user

end