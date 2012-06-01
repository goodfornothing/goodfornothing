class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :mailchimp

  attr_accessible :email, :password, :password_confirmation, :remember_me, :join_mailing_list, :admin, :name

  has_one :ning_profile
  has_many :posts, :class_name => "::Blog::Post"
  has_and_belongs_to_many :gigs
  
  validates_presence_of :name

end
