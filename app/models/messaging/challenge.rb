class Messaging::Challenge < ActiveRecord::Base

	self.table_name = 'messaging_challenges'
 
	attr_accessible :description, :message_attributes
	validates_presence_of :description
	
	has_one :message, :as => :submission
	accepts_nested_attributes_for :message
	
end