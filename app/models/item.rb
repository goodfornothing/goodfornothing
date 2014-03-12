class Item < ActiveRecord::Base
  
  attr_accessible :name, :description, :complete, :gig_id, :payment_value, :provided_by
  
  belongs_to :gig
  
end