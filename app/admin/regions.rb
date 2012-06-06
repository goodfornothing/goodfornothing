ActiveAdmin.register Region do
  
  menu :parent => "Misc"
  
  
	index do
    column :title
    default_actions
  end

end
