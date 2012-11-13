class Messaging::Partner < ActiveRecord::Base
  
	self.table_name = 'messaging_partners'
  
	attr_accessible :notes, :purpose, :message_attributes
	validates_presence_of :notes, :purpose
	
	has_one :message, :as => :submission, :dependent => :destroy	
	accepts_nested_attributes_for :message, :allow_destroy => true
		
end