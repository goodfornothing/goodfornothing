class Messaging::Challenge < ActiveRecord::Base

	self.table_name = 'messaging_challenges'
 
	attr_accessible :contact, :description, :name, :message_attributes
	validates_presence_of :contact, :description, :name
	
	has_one :message, :as => :submission
	accepts_nested_attributes_for :message
	
end