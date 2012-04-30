class Blog::Category < ActiveRecord::Base

	self.table_name = 'blog_categories'

	has_many :posts

end