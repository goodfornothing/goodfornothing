ActiveAdmin.register Slot do
    
    menu :priority => 4
    
    index do
      column :gig
      column :skill
      column :count
      default_actions
    end
    
end
