ActiveAdmin.register Skill do
  
  menu :parent => "Misc"

  show do |skill|
    attributes_table do
      row :title
    end
  end
  
end
