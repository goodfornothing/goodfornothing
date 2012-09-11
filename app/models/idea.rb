class Idea < ActiveRecord::Base

	attr_accessible :body, :user_id, :challenge_id
	validates_presence_of :body, :user, :challenge
	
	belongs_to :user
	belongs_to :challenge

end
