ActiveAdmin.register Library::Tag do
   menu :parent => "Library"
   
  index do
    column :title
    default_actions
  end
  
  show do |tag|
    attributes_table do
      row :title
    end
  end
   
end
