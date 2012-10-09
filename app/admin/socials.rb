ActiveAdmin.register Social do

  controller do
    load_resource :except => :index
    authorize_resource
  end

  menu :priority => 2, :parent => "Events", :if => proc{ can?(:manage, Social) } 

  filter :chapter

  scope :future, :default => true
  scope :past
  scope :all
  
  sidebar "The Hive" do
    render "/admin/shared/help"
  end

	index do
    column :chapter
    column :start_time
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Details" do
      if current_user.role == "admin"
        f.input :chapter
      else
        f.input :chapter, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :start_time, :label => "Date and Time", :as => :just_datetime_picker
      f.input :location
      f.input :description
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
