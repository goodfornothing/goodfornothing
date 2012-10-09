ActiveAdmin.register Skill do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 10, :parent => "Meta", :if => proc{ can?(:manage, Skill) } 

  config.clear_sidebar_sections!
  
  sidebar "The Hive" do
    render "/admin/shared/help"
  end

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
