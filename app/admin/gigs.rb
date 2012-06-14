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
      f.input :friends, :as => :check_boxes
    end
    f.inputs "Identity" do
      f.input :logo
      f.input :poster
    end
    f.inputs "Dates" do
      f.input :start_time, :label => "Start"
      f.input :end_time, :label => "End"
    end
    f.inputs "Details" do
      f.input :title
      f.input :location
      f.input :description
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
  end

end
