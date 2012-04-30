ActiveAdmin.register Blog::Post do
  
	index do
    column :title
    column :category
    column "Author", :user
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :category
      f.input :user, :label => "Author"
      f.input :title
      f.input :body
    end
    f.buttons
  end

end
