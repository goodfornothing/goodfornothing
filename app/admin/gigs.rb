ActiveAdmin.register Gig do

  menu :priority => 1, :parent => "Events"

  filter :chapter
  filter :partner

	index do
    column :title
    column :chapter
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "People" do 
      f.input :chapter
      f.input :partner
    end
    #f.inputs "Identity" do
    #  f.input :logo
    #  f.input :poster
    #end
    f.inputs "Dates" do
      f.input :start_time, :label => "Start"
      f.input :end_time, :label => "End"
    end
    f.inputs "Details" do
      f.input :title
      f.input :location
      f.input :description
    end
    f.inputs "Sponsors" do 
      f.input :friends, :as => :check_boxes
    end
    f.has_many :slots do |j|
      j.input :skill
      j.input :custom_skill
      j.input :limit
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
      row :description
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
              td user.slots.where('gig_id = ?',gig).first.skill.title
              td user.talents.map { |t| "<strong>#{t.skill.title}:</strong> #{t.level}".html_safe }.join("<br />").html_safe
            end
          end
        end
      end
      
    end
    
    div :class => "download_links" do
      "Download attendees: #{link_to "CSV", download_attendees_admin_gig_path(gig, :format => "csv")}".html_safe
    end
    
  end
  
  member_action :download_attendees, :method => :get do
    @gig = Gig.find(params[:id])
    @attendees = @gig.users
  end

end
