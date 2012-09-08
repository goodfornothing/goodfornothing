class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :mailchimp

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :admin, :name, :skill_ids,
                  :gender, :age, :url, :location, :twitter_handle, :approved, 
                  :chapter_id, :avatar

  has_one :ning_profile
  has_many :posts, :class_name => "::Conversation::Post"

  belongs_to :chapter
  has_and_belongs_to_many :slots
  has_and_belongs_to_many :skills
  has_many :gigs, :through => :slots
  has_many :socials, :through => :slots
  
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
  
  # These are devise approval 
  # methods and nothing to do 
  # with Ning user activation
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super
    end 
  end
  
  # Ning user activation path
  def activation_path
    unless user.ning.nil?
      claim_path(user.ning.id,user.id)
    end
  end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
