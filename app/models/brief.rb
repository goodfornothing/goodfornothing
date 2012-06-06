class Brief < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description
	belongs_to :gig
	
end