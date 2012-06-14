class Partner < ActiveRecord::Base
  
  attr_accessible :name, :url, :logo

  has_many :gigs
  
  mount_uploader :logo, LogoUploader
  
end