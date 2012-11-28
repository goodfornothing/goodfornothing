#Curatr.register Trill do
#	
#		module ClassMethods
#	
#			require 'json'
#	
#    	def store(mail)
#
#					# Pull first link as URL
#					urls = URI::extract(mail[:body])
#
#					unless urls.empty?
#
#						# Parse body into Sir Trevor JSON Block
#						body = {
#											:data => [
#											{
#											:type => "text",
#											:data => { :text => mail[:body].gsub(urls.first,'') }
#											}
#											]
#										}
#										
#		      	self.create!(
#		          :title => mail[:subject],
#							:url => urls.first,
#		          :description => body.to_json,
#		          :published => false
#		        )
#
#					end
#
#			end
#			
#		end
#		
#		Trill.send(:extend, ClassMethods)
#		
#end