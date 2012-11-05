class Messaging::Message < ActiveRecord::Base

  attr_accessible :body, :read, :sent
	validates_presence_of :body, :if => :has_no_submission?
	
	belongs_to :user
	has_many :recipients
	belongs_to :submission, :polymorphic => true	
	
	# Only expect a body if there is
	# no associated parent submission

	def has_no_submission?
		self.submission.nil?
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