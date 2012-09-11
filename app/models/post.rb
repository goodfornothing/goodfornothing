class Post < ActiveRecord::Base

  scope :updates, where(:warbling_id => nil)

  attr_accessible :excerpt, :title, :body, :user_id, :chapter_id, :category_id, :chapter_id, :user_id, :hero_image, :warbling_id
  
	belongs_to :chapter
	belongs_to :user
	
	belongs_to :warbling

	validates_presence_of :title, :excerpt, :body
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	extend FriendlyId
  friendly_id :title, use: :slugged

end