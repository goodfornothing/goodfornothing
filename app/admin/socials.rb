ActiveAdmin.register Social do

  menu :priority => 2, :parent => "Events"

  filter :chapter

	index do
    column :title
    column :chapter
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Details" do
      f.input :start_time, :label => "Date and Time"
      f.input :chapter
      f.input :title
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
      row :title
      row :location
      row :description
    end
  end

end
