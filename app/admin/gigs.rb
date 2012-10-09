ActiveAdmin.register Gig do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 1, :parent => "Events", :if => proc{ can?(:manage, Gig) } 

  filter :chapter
  filter :partner

  scope :future, :default => true
  scope :past
  scope :all

	index do
    column :title
    column :chapter
    default_actions
  end
  
  sidebar "The Hive" do
    render "/admin/shared/help"
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
      f.input :location
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
    
    panel 'People' do
      attributes_table_for gig do
        row :chapter
        row :partner
        row :friends do 
          gig.friends.map(&:name).join(', ')
        end
      end
    end
    
    panel "Dates" do
      attributes_table_for gig do
        row "Start" do 
          gig.start_time
        end
        row "End" do
          gig.end_time
        end
      end
    end
    
    attributes_table do
      row :title
      row :location
      row :description do
       if gig.description.is_json?
   		   render_sir_trevor(gig.description)
   		 else
   		   simple_format(gig.description).html_safe
   	   end
   	  end
    end
    
    panel "Attendees" do

      table do
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
    
    div :class => "download_links" do
      "Download attendees: #{link_to "CSV", download_attendees_hive_gig_path(gig, :format => "csv")}".html_safe
    end
    
  end
  
  member_action :download_attendees, :method => :get do
    @gig = Gig.find(params[:id])
    @attendees = @gig.users
  end

end
