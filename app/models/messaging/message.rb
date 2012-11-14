class Messaging::Message < ActiveRecord::Base

  attr_accessible :body, :read, :sent, :email, :name
	
	validates_presence_of :email, :if => :no_user?
	validates_presence_of :name, :if => :no_user?
	
	belongs_to :user
	has_many :recipients
	belongs_to :submission, :polymorphic => true, :dependent => :destroy	
	
	def no_user?
		self.user.nil?
	end
	
	def send_to_recipients
		unless self.recipients.nil?
			MessageMailer.notify(self).deliver
			self.sent = true
			self.save
		end
	end
	
	def mark_as_read
		self.read = true
		self.save
	end
	
	def from_name
		if self.user.present?
			self.user.name
		else
			self.name
		end
	end
	
	def from_email
		if self.user.present?
			self.user.email
		else
			self.email
		end
	end

end