ActiveAdmin::Dashboards.build do
  
  section "Unapproved members", :priority => 1 do
    
    table do
      thead do
        tr do
          th "Name"
          th "Reasons"
          th "Passions"
          th "Talents"
          th "Actions"
        end
      end
      tbody do
        User.order(:created_at).where('approved = false').collect do |user|
          tr do
            td user.name
            td user.reasons_for_joining
            td user.warblings.map(&:title).join(', ')
            td user.talents.map { |t| "<strong>#{t.skill.title}:</strong> #{t.level}".html_safe }.join("<br />").html_safe
            td link_to "Approve", approve_admin_user_path(user)
          end
        end
      end
    end
    
  end

  section "Bookmark Inbox", :priority => 2 do
    ul do
      Bookmark.order(:created_at).where('published = false').collect do |bookmark|
        li link_to(bookmark.title, admin_bookmark_path(bookmark))
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