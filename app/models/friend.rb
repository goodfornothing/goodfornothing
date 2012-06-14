class Friend < ActiveRecord::Base
	
	attr_accessible :name, :url, :logo
	
	has_and_belongs_to_many :gigs
	
	mount_uploader :logo, LogoUploader
	
end