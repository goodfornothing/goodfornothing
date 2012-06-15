ActiveAdmin.register Chapter do
  
  menu :priority => 3, :parent => "People"
  
  config.clear_sidebar_sections!
  
	index do
    column :title
    default_actions
  end
  
  show do |chapter|
    attributes_table do
      row :title
      row :city
      row :country
      row "Organised by" do 
        chapter.users.map(&:name).join(', ')
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Name"
      f.input :city
      f.input :country
      f.input :users, :as => :check_boxes, :label => "Organised by"
    end
    f.buttons
  end
  
end
