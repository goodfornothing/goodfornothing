class Challenge < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id, :bookmark_ids
	belongs_to :gig
	belongs_to :venture
			
	has_and_belongs_to_many :bookmarks
		
end