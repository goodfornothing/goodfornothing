class User < ActiveRecord::Base

  scope :crew, where(:crew => true)
  scope :active, where(:active => true)
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :mailchimp

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :admin, :name,
                  :gender, :age, :url, :location, :twitter_handle, 
                  :chapter_id, :avatar, :warbling_ids, :reasons_for_joining, :crew

  has_one :ning_profile
  has_many :posts
  
  has_many :ideas
  has_many :contributions

  belongs_to :chapter
  
  has_and_belongs_to_many :warblings
  has_and_belongs_to_many :slots
  has_many :gigs, :through => :slots
  has_many :socials, :through => :slots
  
  has_many :talents
  has_many :skills, :through => :talents
  
  validates_presence_of :name
  before_save :check_url_scheme
  
  mount_uploader :avatar, AvatarUploader
	
	extend FriendlyId
  friendly_id :name, use: :slugged
	
	def short_name
	  self.name.split(' ')[0]
	end
	
  def is_attending_gig?(gig)
    self.gigs.include?(gig)
  end
  
  def is_attending_social?(social)
    self.socials.include?(social)
  end
  
  def skill_level(skill)
    level = nil
    self.talents.each do |talent|
      if talent.skill.id == skill.id
        level = talent.level.to_i
      end
    end
    level
  end
  
  def activation_path
    unless user.ning.nil?
      claim_path(user.ning.id,user.id)
    end
  end
  
  def challenges
    Challenge.includes(:contributions,:ideas).where('contributions.user_id = ? or ideas.user_id = ?',self.id,self.id)
  end
  
  def offline_encountered
    User.includes(:gigs,:socials).where("users.id != ? and (gigs.id in (?) or socials.id in (?))",self.id, self.gigs.map(&:id).join(','), self.socials.map(&:id).join(','))
  end
  
  def online_encountered
    User.includes(:ideas,:contributions).where('users.id != ? and (contributions.challenge_id in (?) or ideas.challenge_id in (?))', self.id, self.challenges.map(&:id).join(','), self.challenges.map(&:id).join(','))
  end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
