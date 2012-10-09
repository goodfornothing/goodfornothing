ActiveAdmin.register Trill do
  
  controller do
    load_resource :except => :index
    authorize_resource Trill
  end
  
  menu :priority => 1, :parent => "Warblings", :if => proc{ can?(:manage, Trill) }  
  
  config.clear_sidebar_sections!
  
  sidebar "The Hive" do
    render "/admin/shared/help"
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "State" do
      f.input :published
    end
    f.inputs "Content" do
      f.input :user_id, :as => :hidden, :value => current_user.id
      f.input :hero_image
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :description, :input_html => { :rows => 10 }
    end
    f.inputs "Issues" do
      f.input :issues, :as => :check_boxes
    end
    f.buttons
  end
  
	index do
    column :title
    column("State") { |trill| status_tag((trill.published) ? "Published" : "Unpublished") }
    default_actions
  end
  
  show do |bookmark|
    attributes_table do
      row "Published" do 
        (bookmark.published) ? "Yes" : "No"
      end
      row :title
      row "URL" do
        link_to bookmark.url, bookmark.url
      end
      row :description
      row :hero_image do
        image_tag(bookmark.hero_image.thumbnail) unless bookmark.hero_image.url.nil?
      end
      row "Issues" do |i|
        i.issues.map{ |w| w.title }.join(', ')
      end
    end
  end
  
  member_action :publish do
    trill = Trill.find(params[:id])
    trill.published = true
    trill.save
    redirect_to admin_dashboard_path
  end
  
end
