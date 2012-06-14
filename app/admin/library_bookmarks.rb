ActiveAdmin.register Library::Bookmark do
  menu :parent => "Library"
  
  config.clear_sidebar_sections!
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :curated
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :description, :input_html => { :rows => 5 }
      f.input :tags, :as => :check_boxes
    end
    f.buttons
  end
  
	index do
    column :title
    default_actions
  end
  
  show do |bookmark|
    attributes_table do
      row "Curated?" do 
        (bookmark.curated) ? "Yes" : "No"
      end
      row :title
      row "URL" do
        link_to bookmark.url, bookmark.url
      end
      row :description
      row :tags do 
        bookmark.tags.map(&:title).join(', ')
      end
    end
  end
  
end
