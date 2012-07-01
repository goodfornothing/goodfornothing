class Conversation::Category < ActiveRecord::Base

  attr_accessible :title

	self.table_name = 'conversation_categories'

	has_many :posts
	validates :title, :presence => true
	
	extend FriendlyId
  friendly_id :title, use: :slugged

end