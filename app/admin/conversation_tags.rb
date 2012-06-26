ActiveAdmin.register Conversation::Tag do
   menu :parent => "Conversation"
   
   config.clear_sidebar_sections!
   
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
