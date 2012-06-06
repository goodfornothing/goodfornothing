class Blog::Category < ActiveRecord::Base

  attr_accessible :title

	self.table_name = 'blog_categories'

	has_many :posts
	validates :title, :presence => true
	
	def slug
	  self.title.downcase
	end

end