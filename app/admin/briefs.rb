ActiveAdmin.register Brief do
  
  menu :priority => 3
  
  index do
    column :gig
    column :title
    default_actions
  end

end
