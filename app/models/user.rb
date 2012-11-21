class User < ActiveRecord::Base

  # User roles for CanCan
  ROLES = %w[warbler cause leader admin]

  scope :crew, where("role = 'leader' or role = 'admin'")
  scope :active, where(:activated => true)
  
  scope :admins, where(:role => "admin")
  scope :leaders, where(:role => "leader")
  scope :causes, where(:role => "cause")
  scope :warblers, where(:role => "warbler")
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :role, :name, :brings, :role,
                  :gender, :age, :url, :location, :twitter_handle, :activated, :subscribed,
                  :chapter_id, :avatar, :issue_ids, :reasons_for_joining, :crew

  has_one :ning_profile
  has_many :posts
	has_many :trills

	has_many :recipients
	has_many :messages, :class_name => "Messaging::Message"

  has_many :comments
  has_many :contributions

  belongs_to :chapter

  has_and_belongs_to_many :challenges
  has_and_belongs_to_many :issues
  has_and_belongs_to_many :slots
  has_many :gigs, :through => :slots
  has_many :socials, :through => :slots
  
  has_many :talents
  has_many :skills, :through => :talents
  
  validates_presence_of :name
  before_save :check_url_scheme
  after_save :clear_view_cache

  mount_uploader :avatar, AvatarUploader
	
	extend FriendlyId
  friendly_id :name, use: :slugged
	
	def inbox
		Messaging::Message.joins(:recipients).where('recipients.user_id = ?', self.id)
	end
	
	def clear_view_cache
		ActionController::Base.new.expire_fragment("member_#{self.id}")
	end
	
	def crew?
	  self.role == "admin" || self.role == "leader"
	end
	
	def short_name
	  self.name.split(' ')[0]
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
  
  def working_on
    (Challenge.includes(:contributions,:comments).where('contributions.user_id = ? or comments.user_id = ?',self.id,self.id) + self.challenges).flatten.uniq
  end
  
  def offline_encountered
    User.active.includes(:gigs,:socials).where("users.id != ? and (gigs.id in (?) or socials.id in (?))",self.id, self.gigs.map(&:id).join(','), self.socials.map(&:id).join(','))
  end
  
  def online_encountered
    User.active.includes(:comments,:contributions).where('users.id != ? and (contributions.challenge_id in (?) or (comments.commentable_id in (?) && comments.commentable_type = "Challenge"))', self.id, self.challenges.map(&:id).join(','), self.challenges.map(&:id).join(','))
  end
  
  def member_reach
    (self.online_encountered + self.offline_encountered).uniq
  end
  
  def profile_completion
    @profile = [ 
      self.name,
      self.gender,
      self.avatar.url,
      self.age,
      self.location,
      self.url,
      self.twitter_handle
    ]
          
    ( ( @profile.count.to_f - (@profile.count(nil).to_f+@profile.count("")) ) / @profile.count.to_f) * 100
  end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
