class Slot < ActiveRecord::Base
  
  attr_accessible :limit, :skill_id, :gig_id
  belongs_to :skill
  belongs_to :gig
  has_and_belongs_to_many :users
  
  validates_presence_of :gig
  
  def available_slots
    if self.limit 
      self.limit - self.users.count
    else 
      nil
    end
  end
  
end
