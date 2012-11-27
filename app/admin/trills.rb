ActiveAdmin.register Trill do
  
  controller do
    load_resource :except => :index
    authorize_resource Trill
  end
  
  menu :priority => 3, :parent => "Warblings", :if => proc{ can?(:manage, Trill) }  
  
  filter :title
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		f.inputs "Meta" do
			if f.object.new_record? || f.object.user.nil?
	    	f.input :user_id, :as => :hidden, :value => current_user.id
				current_user.name
			elsif f.object.user.present?
				f.object.user.name
			end
			f.input :published, :label => "Publish this trill now?"
		end
    f.inputs "Content" do
      f.input :title, :as => :string
      f.input :url, :as => :string, :label => "Link"
			f.input :hero_image, :label => "Thumbnail"
      f.input :issues, :as => :check_boxes
    end
		f.inputs "Description" do
			"Write a little bit about what you've found, try to keep it brief"
      if f.object.new_record? || f.object.description.blank? || f.object.description.is_json?
        f.sir_trevor_text_area :description
      else 
        f.input :description
      end
    end
    f.buttons
  end
  
	index do
    column("Title") { |trill| link_to trill.title, hive_trill_path(trill) }
    column("State") { |trill| status_tag((trill.published) ? "Published" : "Unpublished") }
    column "" do |trill|
      "#{link_to "Edit", edit_hive_trill_path(trill)} &nbsp; #{link_to "Delete", hive_trill_path(trill), :method => "delete", :confirm => "Are you sure you wish to delete this trill?"}".html_safe
    end
  end
  
  show do |bookmark|
    attributes_table do
      row "Published" do 
        (bookmark.published) ? "Yes" : "No"
      end
      row "Issues" do |i|
        i.issues.map{ |w| w.title }.join(', ')
      end
      row :title
      row "URL" do
        link_to bookmark.url, bookmark.url
      end
      row :hero_image do
        image_tag(bookmark.hero_image.thumbnail) unless bookmark.hero_image.url.nil?
      end
			row :description do
     	 if bookmark.description.present? && bookmark.description.is_json?
	   		   render_sir_trevor(bookmark.description)
	   		 else
	   		   simple_format(bookmark.description).html_safe
	   	   end
			end
    end
  end
  
  member_action :publish do
    trill = Trill.find(params[:id])
    trill.published = true
    trill.save
    redirect_to hive_dashboard_path
  end
  
end
