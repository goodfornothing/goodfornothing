class Messaging::Chapter < ActiveRecord::Base

	self.table_name = 'messaging_chapters'
 
	attr_accessible :why_you, :why_city, :why_start, :message_attributes
	validates_presence_of :why_you, :why_city, :why_start
	
	has_one :message, :as => :submission, :dependent => :destroy
	accepts_nested_attributes_for :message, :allow_destroy => true
	
end