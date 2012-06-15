class Venture < ActiveRecord::Base
	
	attr_accessible :name, :url, :logo
	
	has_many :briefs
	
	validates_presence_of :name
	
	mount_uploader :logo, LogoUploader
	
	before_save :check_url_scheme
	
end