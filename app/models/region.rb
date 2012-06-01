class Region < ActiveRecord::Base

	has_many :gigs
	has_many :posts, :class_name => "::Blog::Post"

	attr_accessible :title
	
	def slug
	  self.title.downcase
	end

end
