class Slot < ActiveRecord::Base
  
  attr_accessible :limit, :skill_id, :gig_id, :social_id
  belongs_to :skill
  belongs_to :gig
  belongs_to :social
  has_and_belongs_to_many :users
    
  def available_slots
    if self.limit 
      self.limit - self.users.count
    else 
      nil
    end
  end
  
end
