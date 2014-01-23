ActiveAdmin.register Chapter do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :parent => "Community", :if => proc{ can?(:manage, Chapter) } 
  
  config.clear_sidebar_sections!
  
  sidebar "Statistics", :only => :show do
    div :class => "attributes_table" do
      table do
        tbody do
          tr do
            th "Gigs"
            td  chapter.gigs.count
          end
          tr do
            th "Socials"
            td  chapter.socials.count
          end
          tr do
            th "Members"
            td  chapter.users.count
          end
          tr do
             th "Leaders"
             td  chapter.users.crew.count
           end
        end
      end
    end
  end
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
	index do
    column("Name") { |chapter| link_to chapter.title, hive_chapter_path(chapter) }
    column "" do |chapter|
      "#{link_to "Edit", edit_hive_chapter_path(chapter)} &nbsp; #{link_to "Delete", hive_chapter_path(chapter), :method => "delete", :confirm => "Are you sure you wish to delete this chapter?"}".html_safe
    end
  end
  
  show do |chapter|
    attributes_table do
      row "Name" do
        chapter.title
      end
      row :country
      row "Chapter leaders" do 
        chapter.users.crew.map(&:name).join(', ')
      end
			row :shaken_hands
			row :twitter_handle
      row :cover_image
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Name"
      f.input :country
			f.input :shaken_hands
			f.input :twitter_handle
      f.input :cover_image
    end
    f.buttons
  end
  
end
