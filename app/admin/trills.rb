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
	  f.inputs "State" do
      f.input :published, :label => "Publish this trill now?"
    end
    f.inputs "Content" do
      f.input :title, :as => :string
      f.input :url, :as => :string, :label => "Link"
      f.input :hero_image, :label => "Image"
			f.input :vimeo, :label => "Vimeo ID", :hint => "Videos will replace hero images if included"
      f.input :description, :input_html => { :rows => 10 }, :hint => "Write a little bit about what you've found, try to keep it brief"
    end
		f.inputs "User" do
			if f.object.new_record? || f.object.user.nil?
	    	f.input :user_id, :as => :hidden, :value => current_user.id
			end
		end
    f.inputs "Issues" do
      f.input :issues, :as => :check_boxes
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
      row "Image" do
        image_tag(bookmark.hero_image.thumbnail) unless bookmark.hero_image.url.nil?
      end
      row :description do
        simple_format(auto_link(bookmark.description))
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
