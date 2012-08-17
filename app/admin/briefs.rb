ActiveAdmin.register Challenge do
  
  menu :priority => 2, :parent => "Events"
  filter :gig
  filter :venture
  
  index do
    column :venture
    column :title
    column :gig
    default_actions
  end
  
  show do |challenge|
    attributes_table do
      row :gig
      row :venture
      row :title
      row :description
    end
  end

end
