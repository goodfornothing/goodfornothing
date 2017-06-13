ActiveAdmin.register Venture do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :parent => "Community", :if => proc{ can?(:manage, Venture) } 
  
  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/nest/shared/help"
  end
  
  index do
    column("Name") { |venture| link_to venture.name, nest_venture_path(venture) }
    column "" do |venture|
      "#{link_to "Edit", edit_nest_venture_path(venture)} &nbsp; #{link_to "Delete", nest_venture_path(venture), :method => "delete", :confirm => "Are you sure you wish to delete this venture?"}".html_safe
    end
  end
  
  show do |venture|
    attributes_table do
      row :name
      row "Website" do
        link_to venture.url, venture.url unless venture.url.nil?
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