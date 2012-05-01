class Event < ActiveRecord::Base

	has_and_belongs_to_many :users
	belongs_to :region

	def attendees
		self.users
	end
	
end