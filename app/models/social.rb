class Social < ActiveRecord::Base

  scope :past, where("start_time <= ?", Time.now)
  scope :future, where("start_time >= ?", Time.now)

  just_define_datetime_picker :start_time, :add_to_attr_accessible => true

  attr_accessible :chapter_id, :description, :location

	has_many :slots
  has_many :users, :through => :slots
	belongs_to :chapter
	
	after_create :create_generic_slot
	
	validates_presence_of :chapter_id, :start_time
	
	def create_generic_slot
	  Slot.create!(:social_id => self.id)
  end
  
	extend FriendlyId
  friendly_id :start_time, use: :history
  	
end