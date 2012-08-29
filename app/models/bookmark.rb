class Bookmark < ActiveRecord::Base

  attr_accessible :title, :url, :curated
  
	has_and_belongs_to_many :challenges
	has_and_belongs_to_many :warblings

	validates :title, :presence => true
	validates :url, :presence => true

  paginates_per 50

end