class Issue < ActiveRecord::Base

	scope :active, where(:active => true)

  attr_accessible :title, :slug, :description, :active

	has_many :posts
	has_and_belongs_to_many :trills
	has_and_belongs_to_many :challenges
	has_and_belongs_to_many :users
	
	validates :title, :presence => true
	
	extend FriendlyId
  friendly_id :title, use: :history

	def warbles
		 (self.trills.published + self.posts.published).sort_by(&:created_at).reverse
	end

end