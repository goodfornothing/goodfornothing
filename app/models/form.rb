class Form < ActiveRecord::Base

  attr_accessible :title
	validates_presence_of :title

	has_many :messages
	has_many :questions

end