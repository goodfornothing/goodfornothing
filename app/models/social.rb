class Social < ActiveRecord::Base

  attr_accessible :chapter_id, :title, :description, :location, :start_time

	has_many :slots
  has_many :users, :through => :slots
	belongs_to :chapter
	
	after_create :create_generic_slot
	
	validates_presence_of :chapter_id, :title, :start_time
	
	def create_generic_slot
	  Slot.create!(:social_id => self.id)
  end
  
	extend FriendlyId
  friendly_id :title, use: :slugged
  	
end