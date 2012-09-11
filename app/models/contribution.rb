class Contribution < ActiveRecord::Base

  attr_accessible :url, :accepted, :description, :challenge_id, :user_id, :skill_id
  
  belongs_to :challenge
  belongs_to :user
  belongs_to :skill

	validates_presence_of :description, :skill, :url, :user, :challenge

  before_save :check_url_scheme

end