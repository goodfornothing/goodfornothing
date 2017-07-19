ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Nest"

  greetings = {
    'english' => "Hi",
    'danish' => "Hej",
    'australian' => "G'day",
    'dutch' => "Hoi",
    'french' => "Bonjour",
    'new zeland' => "Kia ora"
  }
  
  greeting = greetings.to_a.sample(1)

  content :title => "Nest" do
  
		columns do
			
		  column do

		  	panel "Nest" do
		  		# h3 do 
		  		# 	"Welcome to the Nest."
		  		# end
		  		# span do
		  			text_node "Welcome to the NEST of Good for Nothing. This is where the chapter leaders get their own mixing deck for what is needed to lead their chapters. The platform has all the functionality you need to run gigs, communicate with your chapter and get access to the assets you need. Here is a simple run through of how it works."
		  		# end
		  		# span do
		  			text_node "<br /><br />".html_safe
		  			text_node "Up there ^^^ in the nav bar are the key areas you need to become familiar with. Here is a quick explanation of each area:"
		  		# end
		  		ul do
		  			li do
		  				"<a href='/nest/messages'>Messages</a>: everything that has come into your chapter; new members and challenges in your hood".html_safe
		  			end
		  			li do
		  				"<a href='/nest/gigs'>Gigs</a>: this is where you can setup a new gig, as well as where you can post challenges to associate with the gig".html_safe
		  			end
		  			li do
		  				"Community: and here are all the people that you can connect with about new gigs and ideas for your chapter"
		  			end
		  			li do
		  				"<a href='/nest/pages'>Toolkit</a>: here is where all of the creative assets, and explanations are.".html_safe
		  			end
		  		end

		  		text_node "<br />".html_safe
		  		text_node "This should get you started and do message us at <a href='mailto:hello@goodfornothing.com'>hello@goodfornothing.com</a> if you have any questions and we will get back in touch soon.".html_safe
			  		
		  	end
		  end
        
        # panel "Home" do
        #     h3 do 
        #       greeting[0][1].to_s+" "+current_user.name+"! "+"(now you know how to greet people in "+greeting[0][0].to_s+"!)"
        #     end
        #     @current_chapter = current_user.chapter
        #     @latest_users = @current_chapter.users.last(10).reverse
        #     h4 do
        #       "Last 10 signups to your chapter. Your chapter now has #{@current_chapter.users.length} members."
        #     end
        #     if @latest_users.any?
        #       ul do 
        #         @latest_users.collect do |member|
        #           li do
        #             link_to(member.name, member_path(member)) + " (" + time_ago_in_words(member.created_at) + " ago)"
        #           end
        #         end
        #       end
        #     end

        #     if can?(:read, User)
        #       ul do
        #         li link_to "Browse all your members", nest_users_path
        #         li link_to "Download member details", "/nest/users.csv"
        #       end
        #     end
        # end
			
				# panel "Inbox" do
				# 	@messages = current_user.inbox.unread
				# 	if @messages.any?
		  #         table do
		  #           thead do
		  #             tr do
		  #               th "From"
		  #               th "Message Type"
		  #               th "", :colspan => 2
		  #             end
		  #           end
		  #           tbody do
		  #             @messages.collect do |message|
		  #               tr do
		  #                 td message.from_name
		  #                 td do
				# 								case message.submission_type
				# 									when "Messaging::Challenge"
				# 										"Challenge submission"
				# 									when "Messaging::Chapter"
				# 										"New Chapter Signup"
				# 									when "Messaging::Partner"
				# 										"Partner Request"
				# 									else
				# 										"Direct Message"
				# 								end
				# 							end
		  #                 td link_to "Read", nest_message_path(message)
		  #               end
		  #             end
		  #           end
		  #         end

		  #       else
		  #         div :class => "blank_slate_container" do
		  #           span :class => "blank_slate" do
		  #             span "Inbox zero."
		  #           end
		  #         end
		  #       end
				# end
    #   end

      # column do
      #   panel "Plan an Event" do
      #     ul do
      #       if can?(:manage, Gig)
      #         li link_to "Create a new gig", new_nest_gig_path()
      #       end
      #       if can?(:manage, Social)
      #         li link_to "Create a new social", new_nest_social_path()
      #       end
      #     end

      #     @gig = Gig.where('end_time > ?',Time.now).where('chapter_id = ?', current_user.chapter.id).order("start_time ASC").first
      #     if @gig.present?
      #       h3 do
      #         link_to "Your Next Gig: #{@gig.title}, #{@gig.attendees.count} people attending ", nest_gig_path(@gig)
      #       end
      #     end

      #     @social = Social.where('start_time > ?',Time.now).where('chapter_id = ?', current_user.chapter.id).order("start_time ASC").first
      #     if @social.present?
      #       h3 do
      #         link_to "Your Next Social - #{@social.attendees.count} people attending ", nest_social_path(@social)
      #       end
      #     end          
          
      #     # -
      #     # div do
      #     #   @gig.first.attendees.each do |user|
      #     #     render :partial => "members/avatar", :locals => { :member => user }
      #     #   end
      #     # end
      #   end

      #   if can?(:manage, Challenge)
      #     panel "Challenges" do
      #       link_to "Add a challenge", new_nest_challenge_path()
      #     end
      #   end
      # end

    
			# if can?(:manage, Trill)
			# 	column do

			# 		@trills = Trill.order(:created_at).where('published = false').reverse

			# 	  panel "Trillbox" do

			# 	     if @trills.any?

			#           table do
			#             thead do
			#               tr do
			#                 th "Title"
			#                 th "URL"
			#                 th "", :colspan => 2
			#               end
			#             end
			#             tbody do
			#               @trills.collect do |trill|
			#                 tr do
			#                   td trill.title
			#                   td trill.url
			#                   td link_to "Edit & Publish", edit_hive_trill_path(trill)
			#                 end
			#               end
			#             end
			#           end

			#         else
			#           div :class => "blank_slate_container" do
			#             span :class => "blank_slate" do
			#               span "There are no unpublished trills."
			#             end
			#           end
			#         end

			#       end

			#   end
			# end

		end

  end

end