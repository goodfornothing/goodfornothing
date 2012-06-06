class Slot < ActiveRecord::Base
  
  attr_accessible :count, :skill_id, :gig_id
  belongs_to :skill
  belongs_to :gig
  
end
