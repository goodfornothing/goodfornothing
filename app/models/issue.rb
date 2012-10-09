class Issue < ActiveRecord::Base

  attr_accessible :title, :slug

	has_many :posts
	has_and_belongs_to_many :trills
	has_and_belongs_to_many :challenges
	has_and_belongs_to_many :users
	
	validates :title, :presence => true
	
	extend FriendlyId
  friendly_id :title, use: :history

end