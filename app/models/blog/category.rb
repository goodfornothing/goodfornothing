class Blog::Category < ActiveRecord::Base

	self.table_name = 'blog_categories'

	has_many :posts

	validates :title, :presence => true

end