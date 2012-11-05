class Messaging::Message < ActiveRecord::Base

  attr_accessible :body, :user, :read, :sent
	validates_presence_of :body, :user
	
	# optional validation on body and user - depending on parent - where do we auth, here or on the parent?
	
	belongs_to :user
	has_many :recipients
	
	belongs_to :submission, :polymorphic => true	

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