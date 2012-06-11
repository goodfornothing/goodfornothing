ActiveAdmin.register Blog::Category do
  
  menu :parent => "Blog"
  
	index do
    column :title
    default_actions
  end
  
  show do |skill|
    attributes_table do
      row :title
    end
  end
  
end
