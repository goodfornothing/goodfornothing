ActiveAdmin.register Gig do

  menu :priority => 1

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


end
