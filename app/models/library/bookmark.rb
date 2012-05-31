class Library::Bookmark < ActiveRecord::Base

	self.table_name = 'library_bookmarks'

	has_and_belongs_to_many :tags

	validates :title, :presence => true
	validates :url, :presence => true


end