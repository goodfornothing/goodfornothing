class Gig < ActiveRecord::Base

  attr_accessible :region_id, :title, :description, :location, :start_time, :end_time, :skill_ids

	has_and_belongs_to_many :users
	has_many :briefs
	has_many :slots
	belongs_to :region

	def attendees
		self.users
	end
	
	def places
	  self.slots.count
	end
	
	def available_places
	  self.places - self.attendees.count
  end
	
end