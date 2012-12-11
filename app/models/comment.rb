class Comment < ActiveRecord::Base

  attr_accessible :user_id, :body, :commentable_id, :commentable_type
	
	# for activity history
	alias_attribute :audited_at, :created_at
	
	belongs_to :commentable, :polymorphic => true
	belongs_to :user
	
	validates_presence_of :user, :body
	
end