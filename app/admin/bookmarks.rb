ActiveAdmin.register Bookmark do
  menu :parent => "Warblings"
  
  config.clear_sidebar_sections!
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "State" do
      f.input :published
    end
    f.inputs "Content" do
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :description, :input_html => { :rows => 5 }
    end
    f.inputs "Tag" do
      f.input :warblings, :as => :check_boxes
    end
    f.buttons
  end
  
	index do
    column :title
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
      row "Warblings" do |i|
        i.warblings.map{ |w| w.title }.join(', ')
      end
    end
  end
  
end
