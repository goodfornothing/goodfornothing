class Messaging::Message < ActiveRecord::Base

  attr_accessible :body, :read, :sent, :email, :name
	
	validates_presence_of :email, :if => :no_user?
	validates_presence_of :name, :if => :no_user?
	
	belongs_to :user
	has_many :recipients
	belongs_to :submission, :polymorphic => true	
	
	def no_user?
		self.user.nil?
	end

	def mark_as_sent
		self.sent = true
		self.save
	end
	
	def mark_as_read
		self.read = true
		self.save
	end

end