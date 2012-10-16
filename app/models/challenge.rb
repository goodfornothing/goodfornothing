class Challenge < ActiveRecord::Base

	scope :activated, where(:active => true)
  scope :inactive, where(:active => false)

  attr_accessible :gig_id, :title, :description, :venture_id, :contact, :partner_id,
                  :issue_ids, :featured, :active, :open, :open_to_contributions
                  
	belongs_to :gig
	belongs_to :venture
	belongs_to :partner
	has_many :contributions
	has_and_belongs_to_many :issues
	has_and_belongs_to_many :users
	
	validates_presence_of :title
  before_save :assert_featured
	
	extend FriendlyId
  friendly_id :title, use: :history

	acts_as_commentable :label => "Idea", :title => "Share your ideas"
	
	def team
    (User.includes(:contributions,:comments).where('contributions.challenge_id = ? or (comments.commentable_id = ? && comments.commentable_type = "Challenge")',self.id,self.id) + self.users).flatten.uniq
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