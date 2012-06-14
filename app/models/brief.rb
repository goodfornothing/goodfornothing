class Brief < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id
	belongs_to :gig
	belongs_to :venture
	
	validates_presence_of :title
	validates_presence_of :description
	
end