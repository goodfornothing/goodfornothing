ActiveAdmin.register Gig do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 4, :parent => "Events", :if => proc{ can?(:manage, Gig) } 

  filter :title

  scope :future, :default => true
  scope :past
  scope :all

	index do
    column("Title") { |gig| link_to gig.title, hive_gig_path(gig) }
    column("Chapter") { |gig| gig.chapter.title if gig.chapter.present? }
    column :start_time
    column "" do |gig|
      "#{link_to "Edit", edit_hive_gig_path(gig)} &nbsp; #{link_to "Delete", hive_gig_path(gig), :method => "delete", :confirm => "Are you sure you wish to delete this gig?"}".html_safe
    end
  end
  
  sidebar "Statistics", :only => :show do
    div :class => "attributes_table" do
      table do
        tbody do
          tr do
            th "Attendees"
            td  gig.users.count
          end
          if gig.slots.count != 1 && !gig.slots.first.skill.nil?
            gig.slots.each do |slot|
              tr do
                th (slot.skill.nil?) ? slot.custom_skill : slot.skill.title
                td "#{slot.users.count} / #{(slot.limit) ? slot.limit : "&#8734;"}".html_safe
              end
            end
          end
        end
      end
      if gig.users.any?
        span link_to "View details", "#attendees"
      end
    end
  end
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
    
    f.inputs "Who?" do 
      if current_user.role == "admin"
        f.input :chapter
      else
        f.input :chapter, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :partner
    end
  
    f.inputs "When?" do
      f.input :start_time, :label => "Start", :as => :just_datetime_picker
      f.input :end_time, :label => "End", :as => :just_datetime_picker
    end
    f.inputs "What?" do
      f.input :title
      f.input :location, :hint => "Enter the street address of your venue, you don't need to include a city or country"
    end
    f.inputs "Details" do
      if gig.new_record? || gig.description.is_json?
        f.sir_trevor_text_area :description
      else 
        f.input :description
      end
    end
    f.inputs "Sponsors" do 
      f.input :friends, :as => :check_boxes
    end
    f.inputs "Registration Slots" do
      f.has_many :slots do |j|
        j.input :skill
        j.input :custom_skill
        j.input :limit
      end
    end
    f.buttons
  end

  show do |gig|
    
    columns do
      
      column do
    
       panel 'Who?' do
          attributes_table_for gig do
            row :chapter
            row :partner
            row :friends do 
              gig.friends.map(&:name).join(', ')
            end
          end
        end
      end
  
      column do
    
        panel "Where and when?" do
          attributes_table_for gig do
            row "Start" do 
              gig.start_time
            end
            row "End" do
              gig.end_time
            end
            row :location
          end
        end
        
      end
      
    end
    
    panel "Details" do
      attributes_table_for gig do
        row :title
        row :description do
         if !gig.description.nil? && gig.description.is_json?
     		   render_sir_trevor(gig.description)
     		 else
     		   simple_format(gig.description).html_safe
     	   end
     	  end
      end
    end
    
    if gig.users.any?
    
      panel "Attendees" do

        table :id => "attendees" do
          thead do
            tr do
              th "Name"
              th "Email"
              th "Ticket"
              th "Talents"
            end
          end
          tbody do
            gig.users.each do |user|
              tr do
                td link_to(user.name, member_path(user))
                td user.email
                td (user.slots.where('gig_id = ?',gig).first.skill.nil?) ? user.slots.where('gig_id = ?',gig).first.custom_skill : user.slots.where('gig_id = ?',gig).first.skill.title
                td user.talents.map { |t| "<strong>#{t.skill.title}:</strong> #{t.level}".html_safe }.join("<br />").html_safe
              end
            end
          end
        end
      
      end
      
    end
    
    div :class => "download_links" do
      "Download attendees: #{link_to "CSV", download_attendees_hive_gig_path(gig, :format => "csv")}".html_safe
    end
    
  end
  
  member_action :download_attendees, :method => :get do
    @gig = Gig.find(params[:id])
    @attendees = @gig.users
    headers['Content-Type'] = "text/csv"
    filename = "attendees_#{@gig.slug}_#{Time.now.strftime("%d_%m_%Y")}"
    headers['Content-Disposition'] = "attachment; filename=#{filename}"
  end

end
