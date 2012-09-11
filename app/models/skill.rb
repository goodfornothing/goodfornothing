class Skill < ActiveRecord::Base
  
  attr_accessible :title
  
  has_and_belongs_to_many :gigs
  has_many :talents
  has_many :users, :through => :talents
  has_many :contributions
  
  validates_presence_of :title
	
end
