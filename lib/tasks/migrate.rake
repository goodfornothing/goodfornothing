require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :migrate do
  
  desc 'Import bookmarks in Netscape Bookmark format'
  task :bookmarks => :environment do

		doc = Nokogiri::HTML(open(File.join(Rails.root, "lib/samples/library.html")))

		# Ensure we're dealing with the correct format
		unless doc.internal_subset.name == "NETSCAPE-Bookmark-file-1"
			puts "Import failed, not Netscape Bookmark format"
			return
		end

		puts "Importing bookmarks"

		doc.xpath('//dt/a').each do |node|

			bookmark_url = node.attr('href')
			bookmark = Conversation::Bookmark.find_by_url(bookmark_url)

			if bookmark.nil?
				puts "Creating bookmark: #{node.text}"

				# Create bookmark
				bookmark = Conversation::Bookmark.create! do |b|
					b.title = node.text
					b.url = node.attr('href')
					b.published = true
				end

				# Associate tags (parent folders)
				node.xpath('ancestor::dl').xpath('preceding-sibling::dt/h3').each do |d|
					tag = Conversation::Tag.find_by_title(d.text)
					if tag.nil?
						tag = Conversation::Tag.create do |t|
							t.title = d.text
						end
					end
					tag.save!
					bookmark.tags << tag
				end

			end

			bookmark.save!

		end

		puts "-- Done"

  end
  
  desc 'Import from ning member dump'
  task :ning => :environment do

		csv_text = File.read(File.join(Rails.root, "lib/samples/ning.csv"))
    csv = CSV.parse(csv_text, :headers => true)

    csv.each_with_index do |row, i|

      puts "Importing #{row['Email']}..."
      row = row.to_hash.with_indifferent_access

      # Check for user on ning table before importing
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

      # Check for user on devise table before importing
      user = User.find_by_email(ning_user.email)
      if user.nil?
        puts "Creating a new devise user"
        user = User.create! do |u| 
        	u.email = ning_user.email
          u.name = ning_user.name
          u.password = 'password'
          u.password_confirmation = 'password'
          u.approved = true
          u.admin = true
        end
      else
        puts "Devise user already exists, skipping"
      end

      ning_user.user = user
			ning_user.save!
      user.save!

    end

  end
  
  desc 'Import posts, categories and tags from a from WordPress eXtended RSS export.'
  task :wordpress => :environment do

		doc = Nokogiri::XML(open(File.join(Rails.root, "lib/samples/blog.xml")))

		# Ensure we're dealing with the correct format
		begin
			doc.xpath("//wp:wxr_version")
		rescue
			puts "Import failed, not WordPress eXtended RSS format."
			return
		end

		site_title = doc.xpath('//channel/title').text
		site_url = doc.xpath('//wp:base_site_url').text
		image_path = 'public/imports/'
		relative_image_path = '/imports/'

		puts "Starting import from '#{site_title}'"

		# Import WP categories
		puts "Importing categories"
		doc.xpath('//category[@domain="category"]').each do |node|
  		unless node.text == "Uncategorized"
  			category = Conversation::Category.find_by_title(node.text)
  			if category.nil?
	  			puts "Creating category: #{node.text}"
	  			category = Conversation::Category.create! do |c|
	  				c.title = node.text
	  			end
	  		end
  			category.save!
  		end
		end

		# Import WP tags
		# puts "Importing tags"
		#doc.xpath('//category[@domain="post_tag"]').each do |node|
		#	tag = Blog::Tag.find_by_title(node.text)
		#	if tag.nil?
  	#		puts "Creating tag: #{node.text}"
  	#		cat = Blog::Tag.create! do |category|
  	#			tag.title = node.text
  	#		end
  	#	end
		#	cat.save!
		#end

		# Import posts
		puts "Importing posts"
		doc.xpath('//item').each do |item|

			# Only import published blog posts
			if item.xpath('wp:status').text == "publish"

				wp_post_id = item.xpath('wp:post_id').text
				post = Conversation::Post.find_by_wordpress_id(wp_post_id)
				
				if post.nil?
					
					puts "Creating blog post: #{item.xpath('title').text}"
					post = Conversation::Post.create! do |p|
						p.title = item.xpath('title').text
						p.excerpt = item.xpath('title').text
						p.body = item.xpath('content:encoded').text
						p.created_at = Date.parse(item.xpath('pubDate').text)
						p.wordpress_id = wp_post_id
					end

					# Import images that reside on the site we're importing from
					body_html = Nokogiri::HTML(item.xpath('content:encoded').inner_html())

					body_html.xpath('//img').each do |img|

						puts "Downloading image: #{img.attr('src')}"
						image_url = URI::parse(img.attr('src'))
						image_filename = image_url.path.split('/').last

						if "#{image_url.scheme}://#{image_url.host}" == site_url
							open("#{image_path}#{image_filename}", 'wb') do |file|
  							file << open(img.attr('src')).read
							end
						end
						
						# Rewrite body to include new image paths
						post.body = post.body.gsub(/(#{image_url})/,"#{relative_image_path}#{image_filename}")

					end

					# Associate category
					pc = Conversation::Category.find_by_title(item.xpath('category').first.text)
					item.xpath('category').each do |c|
						pc = Conversation::Category.find_by_title(c.text) if pc.nil?
					end
					post.category = pc unless pc.nil?

				end

				post.save!

			end

		end

		puts "-- Done"

  end
  
end