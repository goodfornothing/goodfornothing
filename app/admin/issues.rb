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
    render "/nest/shared/help"
  end
  
	index do
    column :title
		column :hashtag
    default_actions
  end
  
  show do |skill|
    attributes_table do
      row :title
			row :hashtag
			row :descriptions
    end
  end
  
  form do |f|
		f.inputs "Meta" do
			f.input :icon
			f.input	:hashtag
			f.input :active
		end
    f.inputs "Details" do
      f.input :title
			f.input :description, :input_html => { :rows => 5 }
    end
    f.buttons
  end
  
end
