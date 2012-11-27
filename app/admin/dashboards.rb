ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => "Welcome to the Hive" do
  

		columns do
			
		  column do
			
				panel "Inbox" do
					@messages = current_user.inbox.unread
					if @messages.any?
		          table do
		            thead do
		              tr do
		                th "From"
		                th "Message Type"
		                th "", :colspan => 2
		              end
		            end
		            tbody do
		              @messages.collect do |message|
		                tr do
		                  td message.from_name
		                  td do
												case message.submission_type
													when "Messaging::Challenge"
														"Challenge submission"
													when "Messaging::Chapter"
														"New Chapter Signup"
													when "Messaging::Partner"
														"Partner Request"
													else
														"Direct Message"
												end
											end
		                  td link_to "Read", hive_message_path(message)
		                end
		              end
		            end
		          end

		        else
		          div :class => "blank_slate_container" do
		            span :class => "blank_slate" do
		              span "Inbox zero."
		            end
		          end
		        end
				end
			end
    
			if can?(:manage, Trill)
				column do

					@trills = Trill.order(:created_at).where('published = false').reverse

				  panel "Trillbox" do

				     if @trills.any?

			          table do
			            thead do
			              tr do
			                th "Title"
			                th "URL"
			                th "", :colspan => 2
			              end
			            end
			            tbody do
			              @trills.collect do |trill|
			                tr do
			                  td trill.title
			                  td trill.url
			                  td link_to "Edit & Publish", edit_hive_trill_path(trill)
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