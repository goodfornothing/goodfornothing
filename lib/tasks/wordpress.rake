require 'nokogiri'
require 'open-uri'

namespace :wordpress do
  desc '-- Import posts, categories and tags from a from WordPress eXtended RSS export.'
  task :import => :environment do

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
		image_path = 'public/system/imports/'
		relative_image_path = '/system/imports/'

		puts "Starting import from '#{site_title}'"

		# Import WP categories
		puts "Importing categories"
		doc.xpath('//category[@domain="category"]').each do |node|
  		unless node.text == "Uncategorized"
  			category = Blog::Category.find_by_title(node.text)
  			if category.nil?
	  			puts "Creating category: #{node.text}"
	  			category = Blog::Category.create! do |c|
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
				post = Blog::Post.find_by_wordpress_id(wp_post_id)
				
				if post.nil?
					
					puts "Creating blog post: #{item.xpath('title').text}"
					post = Blog::Post.create! do |p|
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
					pc = Blog::Category.find_by_title(item.xpath('category').first.text)
					item.xpath('category').each do |c|
						pc = Blog::Category.find_by_title(c.text) if pc.nil?
					end
					post.category = pc unless pc.nil?

				end

				post.save!

			end

		end

		puts "-- Done"

  end
end