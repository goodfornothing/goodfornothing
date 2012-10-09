ActiveAdmin.register Venture do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :parent => "Community", :if => proc{ can?(:manage, Venture) } 
  
  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  index do
    column :name
    default_actions
  end
  
  show do |venture|
    attributes_table do
      row :name
      row "Website" do
        venture.url unless venture.url.nil?
      end
      row :logo do
        image_tag(venture.logo.url) unless venture.logo.url.nil?
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url, :label => "Website"
      f.input :logo
    end
    f.buttons
  end
  
end