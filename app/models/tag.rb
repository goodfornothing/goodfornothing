class Tag < ActiveRecord::Base

  attr_accessible :title, :slug
	has_and_belongs_to_many :bookmarks
	
	validates :title, :presence => true
	
	extend FriendlyId
  friendly_id :title, use: :slugged

end