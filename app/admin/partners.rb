ActiveAdmin.register Partner do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 4, :parent => "Community", :if => proc{ can?(:manage, Partner) } 
  
  config.clear_sidebar_sections!
  
  scope :active, :default => true
  scope :inactive
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  index do
    column("Name") { |partner| link_to partner.name, hive_partner_path(partner) }
    column "" do |partner|
      "#{link_to "Edit", edit_hive_partner_path(partner)} &nbsp; #{link_to "Delete", hive_partner_path(partner), :method => "delete", :confirm => "Are you sure you wish to delete this partner?"}".html_safe
    end
  end
  
  show do |partner|
    
    panel "Partner" do
      attributes_table_for partner do
        row :name
        row "Website" do
          link_to partner.url, partner.url unless partner.url.nil?
        end
        row :logo do
          image_tag(partner.logo.url) unless partner.logo.url.nil?
        end
      end
    end
    
    panel "Partership request details" do
      attributes_table_for partner do
        row :contact
        row :purpose
        row :notes
      end
    end
    
  end
  
  form do |f|
    f.inputs "State" do
      f.input :active
    end
    f.inputs "Details" do
      f.input :name
      f.input :url, :label => "Website"
      f.input :logo
    end
    f.buttons
  end
  
end
