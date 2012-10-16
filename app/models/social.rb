class Social < ActiveRecord::Base

  scope :past, where("start_time <= ?", Time.now)
  scope :future, where("start_time >= ?", Time.now)

  attr_accessible :chapter_id, :description, :location, :title, :slots_attributes, :open

	has_many :comments, :as => :commentable
	has_many :slots
  has_many :users, :through => :slots
	belongs_to :chapter
	
	after_create :create_generic_slot
	validates_presence_of :chapter_id, :start_time
	accepts_nested_attributes_for :slots
	  
	extend FriendlyId
  friendly_id :start_time, use: :history
	just_define_datetime_picker :start_time, :add_to_attr_accessible => true
	
  acts_as_commentable :title => "What's your Better Problem?", :label => "Problem"

	def create_generic_slot
	  Slot.create!(:social_id => self.id)
  end

	def name
		if self.title.present?
			self.title
		else
			"A social in #{self.chapter.title}"
		end
	end
  	
end