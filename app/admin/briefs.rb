ActiveAdmin.register Brief do
  
  menu :priority => 3
  
  index do
    column :title
    column :gig
    default_actions
  end
  
  show do |brief|
    attributes_table do
      row :gig
      row :title
      row :description
    end
  end

end
