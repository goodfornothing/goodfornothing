ActiveAdmin.register Chapter do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 3, :parent => "Community", :if => proc{ can?(:manage, Chapter) } 
  
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
        chapter.users.crew.map(&:name).join(', ')
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Name"
      f.input :city
      f.input :country
    end
    f.buttons
  end
  
end
