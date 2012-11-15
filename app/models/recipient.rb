class Recipient < ActiveRecord::Base

	attr_accessible :message_id, :user_id

	belongs_to :message, :class_name => "::Messaging::Message"
	belongs_to :user

end