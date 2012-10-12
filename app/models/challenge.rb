class Challenge < ActiveRecord::Base

  attr_accessible :gig_id, :title, :description, :venture_id, :contact, :partner_id,
                  :issue_ids, :featured, :active, :open, :open_to_contributions
                  
	belongs_to :gig
	belongs_to :venture
	belongs_to :partner
	
	has_and_belongs_to_many :issues		
	
	has_many :ideas
	has_many :contributions
	has_and_belongs_to_many :users
	
	extend FriendlyId
  friendly_id :title, use: :history
  
  validates_presence_of :title
	
	scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  scope :opened, where(:active => true, :open => true)
  scope :closed, where(:active => true, :open => false)
  
  before_save :assert_featured
		
	def team
    (User.includes(:contributions,:ideas).where('contributions.challenge_id = ? or ideas.challenge_id = ?',self.id,self.id) + self.users).flatten.uniq
  end
  
  def assert_featured
    if self.featured?
      Challenge.where('id != ?',self.id).each do |challenge|
        challenge.featured = false
        challenge.save!
      end
    end
  end
		
end