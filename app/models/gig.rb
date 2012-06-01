class Gig < ActiveRecord::Base

  attr_accessible :region_id, :title, :description, :location, :start_time, :end_time

	has_and_belongs_to_many :users
	has_many :briefs
	belongs_to :region

	def attendees
		self.users
	end
	
end