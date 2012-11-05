class Messaging::Challenge < ActiveRecord::Base

	self.table_name = 'messaging_challenges'
 
	attr_accessible :contact, :description, :name, :message_attributes
	
	has_one :message, :as => :submission
	accepts_nested_attributes_for :message
	
end