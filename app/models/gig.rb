class Gig < ActiveRecord::Base
  
	acts_as_event
	
  attr_accessible :partner_id, :friend_ids, :logo

	# for activity history
	alias_attribute :audited_at, :start_time

	has_many :challenges
	
	belongs_to :partner
	has_and_belongs_to_many :friends
		
	validates_presence_of :description
	
	mount_uploader :logo, ArticleImageUploader
  	
end