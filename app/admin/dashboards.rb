ActiveAdmin::Dashboards.build do

  section "Bookmark Inbox", :priority => 2 do
    
    table do
      thead do
        tr do
          th "Title"
          th "URL"
          th "Actions"
        end
      end
      tbody do
        Bookmark.order(:created_at).where('published = false').collect do |bookmark|
          tr do
            td bookmark.title
            td bookmark.url
            td link_to "Publish", publish_admin_bookmark_path(bookmark)
          end
        end
      end
    end
    
  end
  
  section "Challenge Submissions", :priority => 3 do
    ul do
      Challenge.inactive.collect do |challenge|
        li link_to(challenge.title, admin_challenge_path(challenge))
      end
    end
  end
  
  section "Partner Requests", :priority => 4 do
    ul do
      Partner.inactive.collect do |partner|
        li link_to(partner.name, admin_partner_path(partner))
      end
    end
  end
  
end