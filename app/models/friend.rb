class Friend < ActiveRecord::Base
	
	attr_accessible :name, :url, :logo
	
	has_and_belongs_to_many :gigs
	
	validates_presence_of :name
	validates_presence_of :url
	
	mount_uploader :logo, LogoUploader
	
	before_save :check_url_scheme
	
end