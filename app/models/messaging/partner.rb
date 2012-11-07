class Messaging::Partner < ActiveRecord::Base

	self.table_name = 'messaging_partners'
 
	attr_accessible :contact, :notes, :name, :purpose, :message_attributes
	validates_presence_of :contact, :notes, :purpose, :name
	
	has_one :message, :as => :submission
	accepts_nested_attributes_for :message
	
end