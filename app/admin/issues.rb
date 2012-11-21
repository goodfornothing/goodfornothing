ActiveAdmin.register Issue do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  scope :active, :default => true
	scope :all

  menu :priority => 10, :parent => "Meta", :if => proc{ can?(:manage, Issue) } 
   
  config.clear_sidebar_sections!
  
  actions :index, :destroy, :edit, :update, :new, :create
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
	index do
    column :title
    default_actions
  end
  
  show do |skill|
    attributes_table do
      row :title
			row :descriptions
    end
  end
  
  form do |f|
		f.inputs "Meta" do
			f.input :active
			f.input :icon
		end
    f.inputs "Details" do
      f.input :title
			f.input :description
    end
    f.buttons
  end
  
end
