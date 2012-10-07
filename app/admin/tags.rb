ActiveAdmin.register Tag do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 4, :parent => "Conversations", :if => proc{ can?(:manage, Tag) } 
   
  config.clear_sidebar_sections!
  
	index do
    column :title
    default_actions
  end
  
  show do |skill|
    attributes_table do
      row :title
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title
    end
    f.buttons
  end
  
end
