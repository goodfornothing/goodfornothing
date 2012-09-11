class Challenge < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id, :contact,
                  :bookmark_ids, :warbling_ids, :featured, :active, :open
                  
	belongs_to :gig
	belongs_to :venture
	
	has_and_belongs_to_many :warblings		
	has_and_belongs_to_many :bookmarks
	
	has_many :ideas
	has_many :contributions
	
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_presence_of :title
  
	def cause
	  if self.venture.present?
	    self.venture.name
	  elsif self.gig.present?
	    if self.gig.partner.present?
  	    self.gig.partner.name
  	  else
	      self.gig.title
	    end
	  else
	    nil
	  end
	end
	
	scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  scope :open, where(:active => true, :open => true)
  scope :closed, where(:active => true, :open => false)
		
	def team
    User.includes(:contributions,:ideas).where('contributions.challenge_id = ? or ideas.challenge_id = ?',self.id,self.id)
  end
		
end