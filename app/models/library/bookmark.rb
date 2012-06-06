class Library::Bookmark < ActiveRecord::Base

  attr_accessible :title, :url, :curated, :tag_ids
  
	self.table_name = 'library_bookmarks'

	has_and_belongs_to_many :tags

	validates :title, :presence => true
	validates :url, :presence => true


end