require 'nokogiri'
require 'open-uri'

namespace :bookmarks do
  desc '-- Import bookmarks in Netscape Bookmark format'
  task :import => :environment do

		doc = Nokogiri::HTML(open(File.join(Rails.root, "lib/dump/bookmarks_5_8_12.html")))
		#doc = Nokogiri::HTML(open(File.join(Rails.root, "lib/dump/ril.html")))

		# Ensure we're dealing with the correct format
		unless doc.internal_subset.name == "NETSCAPE-Bookmark-file-1"
			puts "Import failed, not Netscape Bookmark format"
			return
		end

		puts "Importing bookmarks"

		doc.xpath('//dt/a').each do |node|

			bookmark_url = node.attr('href')
			bookmark = Library::Bookmark.find_by_url(bookmark_url)

			if bookmark.nil?
				puts "Creating bookmark: #{node.text}"

				# Create bookmark
				bookmark = Library::Bookmark.create! do |b|
					b.title = node.text
					b.url = node.attr('href')
				end

				# Associate tags (parent folders)
				node.xpath('ancestor::dl').xpath('preceding-sibling::dt/h3').each do |d|
					tag = Library::Tag.find_by_title(d.text)
					if tag.nil?
						tag = Library::Tag.create do |t|
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
end