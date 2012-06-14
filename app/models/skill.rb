class Skill < ActiveRecord::Base
  
  attr_accessible :title
  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :gigs
  
  validates_presence_of :title
	
end
