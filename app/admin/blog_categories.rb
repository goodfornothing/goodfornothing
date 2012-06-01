ActiveAdmin.register Blog::Category do
  
  menu :parent => "Blog"
  
	index do
    column :title
    default_actions
  end
  
end
