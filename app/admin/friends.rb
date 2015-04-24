ActiveAdmin.register Friend do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :parent => "Community", :if => proc{ can?(:manage, Friend) } 
  
  config.clear_sidebar_sections!
  
  sidebar "Statistics", :only => :show do
    div :class => "attributes_table" do
      table do
        tbody do
          tr do
            th "Gigs supported"
            td  friend.gigs.count
          end
        end
      end
    end
  end
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  index do
    column("Name") { |friend| link_to friend.name, hive_friend_path(friend) }
    column "" do |friend|
      "#{link_to "Edit", edit_hive_friend_path(friend)} &nbsp; #{link_to "Delete", hive_friend_path(friend), :method => "delete", :confirm => "Are you sure you wish to delete this friend?"}".html_safe
    end
  end
  
  show do |friend|
    attributes_table do
      row :name
      row "Website" do
        link_to friend.url, friend.url unless friend.url.nil?
      end
      row :logo do
        image_tag(friend.logo.url) unless friend.logo.url.nil?
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url, :label => "Website"
      f.input :logo
      f.input :chapters, :as => :check_boxes, :collection=>Chapter.order('title ASC')
    end
    f.buttons
  end
  
end