ActiveAdmin.register Chapter do
	
  config.sort_order = 'title_asc'
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 5, :parent => "Community", :if => proc{ can?(:manage_chapter, Chapter) } 
  
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
    render "/nest/shared/help"
  end
  
	index do
    column("Name") { |chapter| link_to chapter.title, nest_chapter_path(chapter) }
    column "" do |chapter|
      if current_user.role == "admin"   
        "#{link_to "Edit", edit_nest_chapter_path(chapter)} &nbsp; #{link_to "Delete", nest_chapter_path(chapter), :method => "delete", :confirm => "Are you sure you wish to delete this chapter?"}".html_safe
      else
        "#{link_to "Edit", edit_nest_chapter_path(chapter)}".html_safe
      end
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
      if current_user.role == "admin"      
        row :shaken_hands
      end
			row :twitter_handle
      row :chapter_title      
      row :chapter_description      
      row :cover_image
      row :bird_image
      row :chapter_video_embed      
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title, :label => "Name"
      f.input :country
      if current_user.role == "admin"            
        f.input :shaken_hands
      end
			f.input :twitter_handle
      f.input :chapter_title      
      f.input :chapter_description
      f.input :cover_image, :label => "Cover Image (950 x 360)"
      f.input :bird_image, :label => "Bird Image (256 x 256)"
      f.input :chapter_video_embed, :label => "Chapter Video (YouTube or Vimeo URL)"
      f.input :mailchimp_api_key, :label => "Mailchimp API Key"      
      f.input :mailchimp_list_id, :label => "Mailchimp List ID"
    end
    f.buttons
  end
  
end
