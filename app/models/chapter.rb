class Chapter < ActiveRecord::Base

	has_many :gigs
	has_many :socials
	has_many :posts
  has_many :users

	attr_accessible :title, :city, :country, :user_ids, :shaken_hands, :twitter_handle, :twitter_password, :cover_image, :bird_image, :chapter_description, :chapter_title, :chapter_video_embed
	
	validates_presence_of :title

	mount_uploader :cover_image, CoverimageUploader  
	mount_uploader :bird_image, BirdimageUploader  
	
	extend FriendlyId
  friendly_id :title, use: :history

end
