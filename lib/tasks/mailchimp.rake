namespace :mailchimp do
  desc "Update Mailchimp database with segmentation data"
  task :segment => :environment do
    
    mc = Gibbon.new()
    
    User.all.each do |user|
      
      if user.ning_profile.nil?
        p "Skipping non-ning user: #{user.email}"
      else
        p "Updating #{user.email}"
      
        p mc.list_update_member({
          :id => ENV['MC_LIST_ID'], 
          :email_address => user.email, 
          :merge_vars => { 
              :GROUPINGS => [{ 
                  :name => 'Source', 
                  :groups => 'Ning' 
              }],
              :NAME => user.name,
              :CODE => user.reset_password_token,
              :LOCATION => user.ning_profile.location,
              :ACTIVATED => user.activated
          }
        })
      end
      
    end
    
  end
end