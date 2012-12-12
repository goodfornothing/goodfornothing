class Page < ActiveRecord::Base

	has_paper_trail
	
	scope :features, where(:featured => true)

  attr_accessible :title, :body, :slug, :description, :featured

	validates_presence_of :title, :body
	
	belongs_to :user
	
	extend FriendlyId
  friendly_id :title, use: :history

end