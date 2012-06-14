ActiveAdmin.register Chapter do
  
  menu :priority => 5, :parent => "People"
  
	index do
    column :title
    default_actions
  end
  
  show do |chapter|
    attributes_table do
      row :title
    end
  end
  
end
