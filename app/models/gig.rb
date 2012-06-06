class Gig < ActiveRecord::Base

  attr_accessible :region_id, :title, :description, :location, :start_time, :end_time, :skill_ids

	has_many :briefs
	has_many :slots
  has_many :users, :through => :slots
	belongs_to :region
	
	after_create :create_generic_slot
	
	def create_generic_slot
	  Slot.create!(:gig_id => self.id)
  end
  	
end