ActiveAdmin.register Library::Bookmark do
  menu :parent => "Library"
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :curated
      f.input :tags, :as => :check_boxes
    end
    f.buttons
  end
  
	index do
    column :title
    default_actions
  end
  
end
