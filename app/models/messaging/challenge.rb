class Messaging::Challenge < ActiveRecord::Base

	self.table_name = 'messaging_challenges'
 
	attr_accessible :user_ids, :description, :message_attributes, :organisation, :what_they_want, :what_song, :where_heard
	validates_presence_of :description
	
	has_one :message, :as => :submission, :dependent => :destroy
	accepts_nested_attributes_for :message, :allow_destroy => true
	
end