ActiveAdmin.register Idea do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 2, :parent => "Challenges", :if => proc{ can?(:manage, Idea) } 
   
  config.clear_sidebar_sections!
  
  actions :all, :except => [:new]
  
	index do
    column :user
    column :challenge
    default_actions
  end
  
  show do |idea|
    attributes_table do
      row :user
      row :challenge
      row :body
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :user
      f.input :challenge
      f.input :body
    end
    f.buttons
  end
  
end
