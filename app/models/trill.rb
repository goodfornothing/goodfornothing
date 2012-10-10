class Trill < ActiveRecord::Base

  attr_accessible :title, :url, :published, :description, :issue_ids, :hero_image, :user_id
  
	has_and_belongs_to_many :issues

	validates :title, :presence => true
	validates :url, :presence => true

  paginates_per 50
  
  before_save :check_url_scheme
  
  mount_uploader :hero_image, ::ArticleImageUploader
  
  scope :published, where("published = true")
	
end