class Gig < ActiveRecord::Base

  attr_accessible :chapter_id, :title, :description, :location, :start_time, :end_time, :skill_ids, :partner_id, :friend_ids, :bookmark_ids

	has_many :briefs
	has_many :slots
  has_many :users, :through => :slots
	belongs_to :chapter
	belongs_to :partner
	has_and_belongs_to_many :friends
	has_and_belongs_to_many :bookmarks, :class_name => "Library::Bookmark"
	
	after_create :create_generic_slot
	
	mount_uploader :logo, LogoUploader
	mount_uploader :poster, PosterUploader
	
	def create_generic_slot
	  Slot.create!(:gig_id => self.id)
  end
  	
end