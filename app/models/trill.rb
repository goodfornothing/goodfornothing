class Trill < ActiveRecord::Base

  attr_accessible :title, :url, :published, :description, :issue_ids, :hero_image, :user_id, :notified
  
	# for activity history
	alias_attribute :audited_at, :created_at

	has_and_belongs_to_many :issues
	belongs_to :user

	validates :title, :presence => true

  paginates_per 50
  
  before_save :check_url_scheme
  
  mount_uploader :hero_image, ::ArticleImageUploader
  
  scope :published, where("published = true")

	after_save :notify

	def notify
		if !self.notified && self.published
			AdminMailer.published_trill(self).deliver
			self.notified = true
			self.save!
		end
	end
	
end