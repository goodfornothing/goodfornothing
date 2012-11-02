class Message < ActiveRecord::Base

  attr_accessible :body, :user, :read, :sent
	validates_presence_of :body, :user
	
	has_one :user
 	belongs_to :form
	has_many :recipients
	
	has_many :questions, :through => :form
	has_many :answers
	
	def send_to_recipients
		# send something
		##AdminMailer.new_challenge(@challenge).deliver
		self.sent = true
		self.save
	end
	
	def mark_as_read
		self.read = true
		self.save
	end

end