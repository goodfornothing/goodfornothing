class User < ActiveRecord::Base

  scope :crew, where(:crew => true)
  scope :active, where(:activated => true)
  scope :admins, where(:admin => true)
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :mailchimp

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :admin, :name, :brings,
                  :gender, :age, :url, :location, :twitter_handle, :activated,
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
  
  def active_for_authentication? 
    super && activated? 
  end 

  def inactive_message 
    if !activated? 
      :not_approved
    else 
      super
    end 
  end
  
  def challenges
    Challenge.includes(:contributions,:ideas).where('contributions.user_id = ? or ideas.user_id = ?',self.id,self.id)
  end
  
  def offline_encountered
    User.active.includes(:gigs,:socials).where("users.id != ? and (gigs.id in (?) or socials.id in (?))",self.id, self.gigs.map(&:id).join(','), self.socials.map(&:id).join(','))
  end
  
  def online_encountered
    User.active.includes(:ideas,:contributions).where('users.id != ? and (contributions.challenge_id in (?) or ideas.challenge_id in (?))', self.id, self.challenges.map(&:id).join(','), self.challenges.map(&:id).join(','))
  end
  
  def member_reach
    (self.online_encountered + self.offline_encountered).uniq
  end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
