ActiveAdmin.register Slot do
    
    menu :priority => 4
    
    index do
      column :gig
      column :skill
      column :limit
      default_actions
    end
    
end
