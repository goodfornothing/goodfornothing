class Blog::Post < ActiveRecord::Base

  attr_accessible :excerpt, :title, :body, :user_id, :region_id, :category_id, :region_id, :user_id, :hero_image

	self.table_name = 'blog_posts'

	belongs_to :category
	belongs_to :region
	belongs_to :user

	validates :title, :presence => true
	validates :excerpt, :presence => true
	validates :body, :presence => true
	
	mount_uploader :hero_image, ::PostUploader

end