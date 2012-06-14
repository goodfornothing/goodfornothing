ActiveAdmin.register Gig do

  menu :priority => 1, :parent => "Events"

	index do
    column :title
    column :chapter
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Organised by" do 
      f.input :chapter
      f.input :partner
      f.input :friends, :as => :check_boxes
    end
    f.inputs "Identity" do
      f.input :logo
      f.input :poster
    end
    f.inputs "Details" do
      f.input :title
      f.input :location
      f.input :description
      f.input :start_time
      f.input :end_time
    end
    f.buttons
  end

  show do |gig|
    panel 'Organised by' do
      attributes_table_for gig do
        row :chapter
        row :partner
        row :friends
      end
    end
    attributes_table do
      row :title
      row :location
      row :description
      row :start_time
      row :end_time
    end
  end

end
