class Item < ActiveRecord::Base
  
  attr_accessible :name, :description, :complete, :gig_id, :payment_value, :provided_by, :ask_email
  
  belongs_to :gig
  
  before_save :default_values
  
  def default_values
    self[:complete] ||= 0
    self[:ask_email] ||= 0
  end
  
end