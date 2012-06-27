class Conversation::Category < ActiveRecord::Base

  attr_accessible :title

	self.table_name = 'conversation_categories'

	has_many :posts
	validates :title, :presence => true
	
	def slug
	  self.title.downcase.gsub(/\s/,'-')
	end

end