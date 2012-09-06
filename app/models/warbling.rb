class Warbling < ActiveRecord::Base

  attr_accessible :title

	has_many :posts
	has_and_belongs_to_many :bookmarks
	has_and_belongs_to_many :challenges
	
	validates :title, :presence => true
	
	extend FriendlyId
  friendly_id :title, use: :slugged

end