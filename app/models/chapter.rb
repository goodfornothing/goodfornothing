class Chapter < ActiveRecord::Base

	has_many :gigs
	has_many :posts, :class_name => "::Conversation::Post"
  has_many :users

	attr_accessible :title, :city, :country, :user_ids
	
	validates_presence_of :title
	
	extend FriendlyId
  friendly_id :title, use: :slugged

end
