class Answer < ActiveRecord::Base

  attr_accessible :message_id, :question_id, :content
	validates_presence_of :content

	belongs_to :message
	belongs_to :question

end