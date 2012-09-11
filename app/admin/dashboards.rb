ActiveAdmin::Dashboards.build do

  section "Bookmark Inbox", :priority => 2 do
    
    @bookmarks = Bookmark.order(:created_at).where('published = false')
    
    if @bookmarks.any?
    
      table do
        thead do
          tr do
            th "Title"
            th "URL"
            th "Actions"
          end
        end
        tbody do
          @bookmarks.collect do |bookmark|
            tr do
              td bookmark.title
              td bookmark.url
              td link_to "Publish", publish_admin_bookmark_path(bookmark)
            end
          end
        end
      end
      
    end
    
  end
  
  section "Challenge Submissions", :priority => 3 do

    @challenges = Challenge.inactive

    if @challenges.any?

      table do
        thead do
          tr do
            th "Name"
            th "Summary"
            th "Actions"
          end
        end
        tbody do
          @challenges.collect do |challenge|
            tr do
              td challenge.title
              td challenge.description
              td link_to "View", admin_challenge_path(challenge)
            end
          end
        end
      end
    
    end
    
  end
  
  section "Partner Requests", :priority => 4 do
    
    @partners = Partner.inactive
    
    if @partners.any?
    
      table do
        thead do
          tr do
            th "Name"
            th "Purpose"
            th "Summary"
            th "Actions"
          end
        end
        tbody do
          @partners.collect do |partner|
            tr do
              td partner.name
              td partner.purpose
              td partner.notes
              td link_to "View", admin_partner_path(partner)
            end
          end
        end
      end
    
    end
    
  end
  
end