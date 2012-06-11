ActiveAdmin.register Region do
  
  menu :parent => "Misc"
  
	index do
    column :title
    default_actions
  end
  
  show do |region|
    attributes_table do
      row :title
    end
  end
  
end
