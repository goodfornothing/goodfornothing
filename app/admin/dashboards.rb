ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => "Weclome to the Hive" do

    if can?(:manage, Trill)

      @trills = Trill.order(:created_at).where('published = false')

      panel "Unpublished Trills" do
      
        if @trills.any?
             
          table do
            thead do
              tr do
                th "Title"
                th "URL"
                th "Actions", :colspan => 2
              end
            end
            tbody do
              @trills.collect do |trill|
                tr do
                  td trill.title
                  td trill.url
                  td link_to "Edit", edit_hive_trill_path(trill)
                  td link_to "Publish", publish_hive_trill_path(trill)
                end
              end
            end
          end
  
        else
          div :class => "blank_slate_container" do
            br
            span :class => "blank_slate" do
              span "There are no unpublished trills."
            end
            br
          end
        end
        
      end
              
    end
    
    if current_user.role == "admin"

      columns do

        @challenges = Challenge.inactive

        column do

          panel "Challenge requests" do
          
            if @challenges.any?
              table do
                thead do
                  tr do
                    th "Name"
                    th ""
                  end
                end
                tbody do
                  @challenges.collect do |challenge|
                    tr do
                      td challenge.title
                      td link_to "Read more", hive_challenge_path(challenge)
                    end
                  end
                end
              end
            else
              div :class => "blank_slate_container" do
                br
                span :class => "blank_slate" do
                  span "There are no unread challenge submissions."
                end
                br
              end
            end
          
          end
          
        end
        
        column do 

          @partners = Partner.inactive
          
          panel "Partner requests" do
          
            if @partners.any?

              table do
                thead do
                  tr do
                    th "Name"
                    th "Purpose"
                    th ""
                  end
                end
                tbody do
                  @partners.collect do |partner|
                    tr do
                      td link_to partner.name, hive_partner_path(partner)
                      td partner.purpose
                    end
                  end
                end
                
              end
            
            else
              div :class => "blank_slate_container" do
                br
                span :class => "blank_slate" do
                  span "There are no unread partner requests."
                end
                br
              end
            end
            
          end

        end

      end
      
    end
    
  end
end