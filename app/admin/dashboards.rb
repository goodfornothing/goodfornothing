ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => "Welcome to the Hive" do
  

		columns do
		  column do
		    panel "Unread Messages" do
		      
		    end
		  end
    
			column do
				if can?(:manage, Trill)

					@trills = Trill.order(:created_at).where('published = false').reverse

				  panel "Trillbox" do

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
			            span :class => "blank_slate" do
			              span "There are no unpublished trills."
			            end
			          end
			        end

			      end

				end
			end

		end

  end

end