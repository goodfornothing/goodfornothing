class Recipient < ActiveRecord::Base

	attr_accessible :message_id, :user_id

	has_one :message
	has_one :user

end