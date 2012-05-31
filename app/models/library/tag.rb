class Library::Tag < ActiveRecord::Base

	self.table_name = 'library_tags'

	has_and_belongs_to_many :bookmarks
	
	validates :title, :presence => true

end