class Region < ActiveRecord::Base

	has_many :events
	has_many :posts, :class_name => "::Blog::Post"

	attr_accessible :title

end
