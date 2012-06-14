class Venture < ActiveRecord::Base
	
	attr_accessible :name, :url, :logo
	
	has_many :briefs
	
	mount_uploader :logo, LogoUploader
	
end