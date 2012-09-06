class Challenge < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id, :bookmark_ids, :warbling_ids, :featured, :active
	belongs_to :gig
	belongs_to :venture
	
	has_and_belongs_to_many :warblings		
	has_and_belongs_to_many :bookmarks
	
	def cause
	  if self.venture.present?
	    self.venture.name
	  elsif self.gig.present?
	    self.gig.title
	  else
	    nil
	  end
	end
		
end