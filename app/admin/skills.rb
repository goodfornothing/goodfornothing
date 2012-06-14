ActiveAdmin.register Skill do
  
  menu :priority => 6, :parent => "People"

  show do |skill|
    attributes_table do
      row :title
    end
  end
  
end
