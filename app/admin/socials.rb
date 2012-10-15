ActiveAdmin.register Social do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 4, :parent => "Events", :if => proc{ can?(:manage, Social) } 

  filter :chapter

  scope :future, :default => true
  scope :past
  scope :all
  
  actions :index, :destroy, :edit, :update, :new
  
  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/hive/shared/help"
  end

	index do
	  column("Date") { |social| social.start_time.strftime( "%B #{social.start_time.day.ordinalize} %Y")  }
    column("Chapter") { |social| "#{social.chapter.title}" + ((social.title.present?) ? ", #{social.title}" : "") }
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		f.inputs "State" do
			f.input :open, :label => "Open to user comments?"
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
      f.input :description, :input_html => { :rows => 10 }, :hint => "Tell people a little about the format of this social; what should they expect, will they need to bring anything?"
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

  show do |social|
    attributes_table do
      row "Date and Time" do
        social.start_time
      end
      row :chapter
      row :location
      row :description
    end
  end

end
