class Note < ActiveRecord::Base

	has_paper_trail

  attr_accessible :title, :body, :slug

	validates_presence_of :title, :body
	
	extend FriendlyId
  friendly_id :title, use: :history

end