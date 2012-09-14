ActiveAdmin.register Skill do
  
  menu :priority => 4, :parent => "Events"

  config.clear_sidebar_sections!

  index do 
    column :title
    default_actions
  end

  show do |skill|
    attributes_table do
      row :title
      row :description
      row :lower
      row :upper
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description, :label => "What does this include?"
      f.input :lower, :label => "Lower label"
      f.input :upper, :label => "Upper label"
    end
    f.buttons
  end
  
end
