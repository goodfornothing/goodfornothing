class Post < ActiveRecord::Base

  scope :updates, where(:gfn_update => true)
	scope :published, where(:published => true)

  attr_accessible :excerpt, :title, :body, :user_id, :chapter_id, 
									:category_id, :chapter_id, :user_id, :hero_image, 
									:issue_id, :gfn_update, :published, :created_at, :watch, :link
  
	belongs_to :chapter
	belongs_to :user
	belongs_to :issue
	
	# for activity history
	alias_attribute :audited_at, :created_at

	validates_presence_of :title, :excerpt, :body
	
	mount_uploader :hero_image, ::ArticleImageUploader
	
	paginates_per 10
	
	extend FriendlyId
  friendly_id :title, use: :history

end