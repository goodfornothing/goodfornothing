class Recipient < ActiveRecord::Base

	attr_accessible :message_id, :user_id

	belongs_to :message
	belongs_to :user

end