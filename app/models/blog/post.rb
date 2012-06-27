class Blog::Post < ActiveRecord::Base

  attr_accessible :excerpt, :title, :body, :user_id, :chapter_id, :category_id, :chapter_id, :user_id, :hero_image

	self.table_name = 'blog_posts'

	belongs_to :chapter
	belongs_to :user
	
	belongs_to :category, :class_name => "::Conversation::Category"
	has_and_belongs_to_many :tags, :class_name => "::Conversation::Tag"

	validates :title, :presence => true
	validates :excerpt, :presence => true
	validates :body, :presence => true
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	def slug
	  self.title.downcase.gsub(/\s/,'-')
	end

end