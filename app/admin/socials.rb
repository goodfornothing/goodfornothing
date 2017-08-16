ActiveAdmin.register Social do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  # menu :priority => 4, :parent => "Events", :if => proc{ can?(:manage, Social) }
  menu :priority => 4, :parent => "Gigs", :if => proc{ can?(:manage, Social) }
  # menu false

  filter :chapter

  scope :future, :default => true
  scope :past
  scope :all
  
  actions :index, :destroy, :edit, :update, :new, :create, :show
  
  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/nest/shared/help"
  end

	index do
		column("Name") { |social| link_to social.name, nest_social_path(social) }
	  column("Date") { |social| social.start_time.strftime( "%B #{social.start_time.day.ordinalize} %Y")  }
    column("Chapter") { 
      |social| 
      if (social.chapter.present? && social.title.present?)
        "#{social.title} - #{social.chapter.title}"
      else
        if (social.title.present?) 
          "#{social.title}"
        end
        if (social.chapter.present?) 
          "#{social.chapter.title}"
        end
      end
    }
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs "Options" do
			f.input :featured, :label => "Featured on homepage?"
			#f.input :open, :label => "Open to user comments?"
		end
    f.inputs "Details" do
      if current_user.role == "admin"
        f.input :chapter
      else
        f.input :chapter, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :start_time, :label => "Date and Time", :as => :just_datetime_picker
      f.input :location, :hint => "Enter the street address of your venue, you don't need to include a city or country"
			f.input :title, :hint => "Optional, for socials that are themed in some way"
		end
		f.inputs "Description" do
    	if social.new_record? || social.description.is_json?
        f.sir_trevor_text_area :description
      else 
        f.input :description, :input_html => { :rows => 10 }, :hint => "Tell people a little about the format of this social; what should they expect, will they need to bring anything?"
      end
		end
		if !social.new_record?
			f.inputs "Registration Slots" do			
	      f.has_many :slots do |j|
	        j.input :skill
	        j.input :custom_skill, :label => "... or custom slot"
	        j.input :limit
	      end
	    end
		end
    f.buttons
  end

  show do |social|
	
    attributes_table do
      row "Date and Time" do
        social.start_time
      end
      row :chapter
      row :location
      row :description do
      	if !social.description.nil? && social.description.is_json?
   		  	render_sir_trevor(social.description)
   		 	else
   		  	simple_format(social.description).html_safe
   	  	end
   	  end
    end
		
		if social.users.any?
    
      panel "Attendees" do

        table :id => "attendees" do
          thead do
            tr do
              th "Name"
              th "Email"
              th "Ticket Type"
            end
          end
          tbody do
            social.users.each do |user|
              tr do
                td link_to(user.name, member_path(user))
                td user.email
                td (user.slots.where('social_id = ?',social).first.skill.nil?) ? user.slots.where('social_id = ?',social).first.custom_skill : user.slots.where('social_id = ?',social).first.skill.title
              end
            end
          end
        end
      
      end

	    div :class => "download_links" do
	      "Download attendees: #{link_to "CSV", download_attendees_nest_social_path(social, :format => "csv")}".html_safe
	    end
	
		end
		
  end

  member_action :download_attendees, :method => :get do
    @social = Social.find(params[:id])
    @attendees = @social.users
    headers['Content-Type'] = "text/csv"
    filename = "attendees_#{@social.slug}_#{Time.now.strftime("%d_%m_%Y")}"
    headers['Content-Disposition'] = "attachment; filename=#{filename}"
  end

end
