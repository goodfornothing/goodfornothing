namespace :messaging do
  
	desc "Migrate content from old hacky messaging system to new one"
  task :migrate => :environment do
    
    Partner.inactive.where('contact IS NOT NULL').each do |partner|
			
			puts "Migrating #{partner}"
			
			m = Messaging::Partner.new
			m.message = Messaging::Message.new
			
			m.message.email = partner.email
			m.message.name = partner.name
			
			m.purpose = partner.purpose
			m.notes = partner.notes
			
			m.message.users << Chapter.find_by_title('London').users.crew
			m.message.sent = true
			m.message.read = true
			
			m.save!
			
			puts "Saved #{m}"
						
		end
		
		Challenge.inactive.where('contact IS NOT NULL').each do |challenge|
			
			puts "Migrating #{challenge}"
			
			m = Messaging::Challenge.new
			m.message = Messaging::Message.new
			
			m.message.email = challenge.contact
			m.message.name = challenge.title
			
			m.description = challenge.description
			
			m.message.users << Chapter.find_by_title('London').users.crew
			m.message.sent = true
			m.message.read = true
			
			m.save!
			
			puts "Saved #{m}"
			
			
		end
    
  end

end