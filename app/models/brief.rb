class Brief < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description
	belongs_to :gig
	
	validates_presence_of :title
	validates_presence_of :description
	
end