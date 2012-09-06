class Partner < ActiveRecord::Base
  
  attr_accessible :name, :url, :logo, :active, :type

  has_many :gigs
  
  validates_presence_of :name
  
  mount_uploader :logo, LogoUploader
  
  before_save :check_url_scheme
	
end