class Gig < ActiveRecord::Base

  scope :past, where("end_time <= ?", Time.now)
  
  attr_accessible :chapter_id, :title, :description, :location, :start_time, :end_time, :skill_ids, :partner_id, :friend_ids, :poster, :logo

	has_many :challenges
	has_many :slots
  has_many :users, :through => :slots
	belongs_to :chapter
	belongs_to :partner
	has_and_belongs_to_many :friends
	
	after_create :create_generic_slot
	
	validates_presence_of :title, :start_time
	
	mount_uploader :logo, ArticleImageUploader
	mount_uploader :poster, PosterUploader
	
	accepts_nested_attributes_for :slots
	
	def create_generic_slot
	  Slot.create!(:gig_id => self.id)
  end
  
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  def past?
    self.end_time < Time.now
  end
  
  def future?
    self.start_time > Time.now
  end
  	
end