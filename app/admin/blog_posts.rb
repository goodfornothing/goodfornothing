ActiveAdmin.register Blog::Post do
  
  menu :parent => "Blog", :priority => 1
  
	index do
    column :title
    column :category
    column :region
    column "Author", :user
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :category
      f.input :region
      f.input :user, :label => "Author"
      f.input :hero_image
      f.input :title
      f.input :excerpt, :input_html => { :rows => 5 }
      f.input :body
    end
    f.buttons
  end

end
