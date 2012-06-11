ActiveAdmin.register Gig do

  menu :priority => 2

	index do
    column :title
    column :region
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :region
      f.input :title
      f.input :description
      f.input :location
      f.input :start_time
      f.input :end_time
    end
    f.buttons
  end

  show do |gig|
    attributes_table do
      row :region
      row :title
      row :location
      row :description
      row :start_time
      row :end_time
    end
  end

end
