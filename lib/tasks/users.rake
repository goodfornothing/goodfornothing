namespace :users do
  desc "Fix duff twitter handles from the Ning"
  task :twatters => :environment do
    
    User.all.each do |user|
      
      if !user.activated? && user.ning_profile.present?
        user.subscribed = true
      end
      
      if user.twitter_handle.nil? || user.twitter_handle.blank? || user.twitter_handle == "NA"  || user.twitter_handle == "N/A"  || user.twitter_handle == "na"  || user.twitter_handle == "."
        p "Skipping user: #{user.email}"
      else
        p "Updating twitter handle for #{user.twitter_handle}"
        user.twitter_handle = user.twitter_handle.split('/').last
        p "New handle: #{user.twitter_handle}"
        user.save!
      end
      
    end
    
  end
end