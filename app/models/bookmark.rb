class Bookmark < ActiveRecord::Base

  attr_accessible :title, :url, :published, :description, :warbling_ids, :tag_ids, :hero_image
  
  has_and_belongs_to_many :tags
	has_and_belongs_to_many :challenges
	has_and_belongs_to_many :warblings

	validates :title, :presence => true
	validates :url, :presence => true

  paginates_per 50
  
  before_save :check_url_scheme
  
  mount_uploader :hero_image, ::ArticleImageUploader
  
  scope :published, where("published = true")
	
end