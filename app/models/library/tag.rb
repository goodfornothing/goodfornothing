class Library::Tag < ActiveRecord::Base

  attr_accessible :title

	self.table_name = 'library_tags'

	has_and_belongs_to_many :bookmarks
	
	validates :title, :presence => true

end