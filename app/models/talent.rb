class Talent < ActiveRecord::Base
  
  attr_accessible :skill_id, :user_id, :level
	
	belongs_to :user
  belongs_to :skill
	
end
