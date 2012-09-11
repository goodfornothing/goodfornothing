ActiveAdmin.register Partner do
  
  menu :priority => 4, :parent => "Community"
  
  config.clear_sidebar_sections!
  
  index do
    column :name
    default_actions
  end
  
  show do |partner|
    attributes_table do
      row :contact
      row :type
      row :notes
      row :name
      row "Website" do
        partner.url unless partner.url.nil?
      end
      row :logo do
        image_tag(partner.logo.url) unless partner.logo.url.nil?
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url, :label => "Website"
      f.input :logo
      f.input :active
    end
    f.buttons
  end
  
end
