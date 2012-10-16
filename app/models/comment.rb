class Comment < ActiveRecord::Base

  attr_accessible :user_id, :body, :commentable_id, :commentable_type
	
	belongs_to :commentable, :polymorphic => true
	belongs_to :user
	
	validates_presence_of :user, :body
	
end