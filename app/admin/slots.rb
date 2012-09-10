ActiveAdmin.register Slot do
    
    controller do
      def scoped_collection
        Slot.where(:social_id => nil)
      end
    end
        
    menu :priority => 3, :parent => "Events"
    
    filter :gig
    
    index do
      column :skill
      column :limit
      column :gig
      default_actions
    end
    
    show do |skill|
      attributes_table do
        row :skill
        row :limit
        row :gig
      end
    end
    
    form :html => { :enctype => "multipart/form-data" }  do |f|
      f.inputs "Details" do
        f.input :skill
        f.input :gig
        f.input :limit
      end
      f.buttons
    end
    
end
