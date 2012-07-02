namespace :bookmarks do
  desc "Check bookmarks for life, two strikes and you're out. Run every second day at midnight."
  task :ping => :environment do
    
    Conversation::Bookmark.each do |bookmark|
      
      url = URI.parse(bookmark.url)
      #puts "Pinging: #{bookmark.url}"
      begin
        res = Net::HTTP.start(url.host, 80) {|http|
          http.head(url.path) #res.class
        } 
        if bookmark.strikes > 0
          bookmark.strikes = bookmark.strikes-1
          bookmark.save!
        end
      rescue
        bookmark.strikes = bookmark.strikes+1
        bookmark.save!
      end
      
      if bookmark.strikes >= 2
        bookmark.published = false
        bookmark.save!
      end
      
    end
    
  end
end