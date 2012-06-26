class Library::Bookmark < ActiveRecord::Base

  attr_accessible :title, :url, :curated, :tag_ids
  
	self.table_name = 'library_bookmarks'

	has_and_belongs_to_many :gigs, :class_name => "::Gig"
	
	belongs_to :category, :class_name => "::Conversation::Category"
	has_and_belongs_to_many :tags, :class_name => "::Conversation::Tag"

	validates :title, :presence => true
	validates :url, :presence => true

  paginates_per 50

end