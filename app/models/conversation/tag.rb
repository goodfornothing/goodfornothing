class Conversation::Tag < ActiveRecord::Base

  attr_accessible :title

	self.table_name = 'conversation_tags'

	has_and_belongs_to_many :bookmarks, :class_name => "::Library::Bookmark"
	has_and_belongs_to_many :posts, :class_name => "::Blog::Post"
	
	validates :title, :presence => true

end