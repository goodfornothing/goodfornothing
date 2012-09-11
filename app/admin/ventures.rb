ActiveAdmin.register Venture do
  
  menu :priority => 5, :parent => "Community"
  
  config.clear_sidebar_sections!
  
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