class Attendee < ActiveRecord::Base
  
  attr_accessible :slot_id, :user_id
  belongs_to :slot
  belongs_to :user
  
end
