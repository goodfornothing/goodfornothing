require 'csv'

namespace :ning do
  desc 'Import from ning member dump'
  task :import => :environment do

		csv_text = File.read(File.join(Rails.root, "lib/csv/ning_memberdata_test.csv"))
    csv = CSV.parse(csv_text, :headers => true)

    csv.each_with_index do |row, i|

      puts "Importing #{row['Email']}..."
      row = row.to_hash.with_indifferent_access

      # Check for user on ning table
      ning_user = NingProfile.find_by_email(row['Email'])
      if ning_user.nil?
        puts "Creating a new ning user"
        ning_user = NingProfile.create! do |n|
        	n.name = row['Name']
        	n.email = row['Email']
        	n.gender = row['Gender']
        	n.location = row['Location']
        	n.country = row['Country']
        	n.zip = row['Zip']
        	n.age = row['Age']
        	n.website = row['your web space']
        	n.twitter = row['twitter page']
        	n.birthdate = Date.parse(row['Birthdate'])
        	n.reasons_for_joining = row['What makes you want to do Good for Nothing?']
        	n.skills = row['What special skills do you bring?']
        	n.notification_broadcasts = (row['Receiving Broadcasts?']=='Yes') ? true : false
        	n.notification_email = (row['Receiving Any Emails?']=='Yes') ? true : false
        	n.date_joined = Date.parse(row['Date Joined'])
        	n.last_visit = Date.parse(row['Last Visit'])
        end
      else
        puts "Ning user already exists, skipping"
      end

      # Check for user on devise table
      user = User.find_by_email(ning_user.email)
      if user.nil?
        puts "Creating a new devise user"
        user = User.create! do |u| 
        	u.email = ning_user.email
          u.name = ning_user.name
          u.password = 'password'
          u.password_confirmation = 'password'
        end
      else
        puts "Devise user already exists, skipping"
      end

      ning_user.user = user
			ning_user.save!
      user.save!

    end

  end
end