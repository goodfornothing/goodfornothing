Curatr.register Trill do
	
		module ClassMethods
	
			require 'json'
	
    	def store(mail)

					# Pull first link as URL
					urls = URI::extract(mail[:body])
					user = User.find_by_email(mail[:from])

					unless urls.empty? || user.nil?

						if user.can?(:manage, Trill)
						
							# Parse body into Sir Trevor JSON Block
							body = {
												:data => [
													{
														:type => "text",
														:data => { 
															:text => mail[:body].gsub(urls.first,'') 
														}
													}
											]
							}
										
			      	self.create!(
			          :title => mail[:subject],
								:url => urls.first,
			          :description => body.to_json,
			          :published => false,
								:user_id => user.id
			        )
			
						end

					end

			end
			
		end
		
		Trill.send(:extend, ClassMethods)
		
end