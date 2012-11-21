class Issue < ActiveRecord::Base

	scope :active, where(:active => true)

  attr_accessible :title, :slug, :description, :active, :icon

	has_many :posts
	has_and_belongs_to_many :trills
	has_and_belongs_to_many :challenges
	has_and_belongs_to_many :users
	
	validates_presence_of :title, :icon
	
	extend FriendlyId
  friendly_id :title, use: :history

	mount_uploader :icon, IconUploader

	def warbles
		 (self.trills.published + self.posts.published).sort_by(&:created_at).reverse
	end

end