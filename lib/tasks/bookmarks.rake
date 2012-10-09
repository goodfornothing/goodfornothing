namespace :trills do
  desc "Check bookmarks for life, two strikes and you're out. Run every second day at midnight."
  task :ping => :environment do
    
    Trill.each do |trill|
      
      url = URI.parse(trill.url)
      #puts "Pinging: #{bookmark.url}"
      begin
        res = Net::HTTP.start(url.host, 80) {|http|
          http.head(url.path) #res.class
        } 
        if trill.strikes > 0
          trill.strikes = trill.strikes-1
          trill.save!
        end
      rescue
        trill.strikes = trill.strikes+1
        trill.save!
      end
      
      if trill.strikes >= 2
        trill.published = false
        trill.save!
      end
      
    end
    
  end
end