class Brief < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id
	belongs_to :gig
	belongs_to :venture
			
	# All briefs should have a gig, and will
	# either a title, venture or just a description
		
end