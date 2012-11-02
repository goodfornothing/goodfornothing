class Message < ActiveRecord::Base

  attr_accessible :body, :user, :read, :sent
	validates_presence_of :body, :user
	
	has_one :user
 	belongs_to :form
	has_many :recipients
	
	has_many :questions, :through => :form
	has_many :answers
	
	def send
		# send something
		self.sent = true
		self.save
	end
	
	def read
		self.read = true
		self.save
	end

end