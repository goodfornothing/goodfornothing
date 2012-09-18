ActiveAdmin.register Challenge do
  
  menu :priority => 1, :parent => "Challenges"
  
  filter :gig
  filter :venture
  
  index do
    column :title
    column :venture
    column :gig
    default_actions
  end
  
  show do |challenge|
    attributes_table do
      row :active
      row :open
      row :title
      row :contact
      row :description
      row :gig
      row :venture
      row :partner
      row "Warblings" do |i|
        i.warblings.map{ |w| w.title }.join(', ')
      end
      row "Inspirations" do |i|
        i.bookmarks.map{ |w| w.title }.join(', ')
      end
    end
  end
  
  form do |f|
    f.inputs :active
    f.inputs :open
    f.inputs "Associations" do
      f.input :gig
      f.input :venture
      f.input :partner
      f.input :warblings, :as => :check_boxes
    end
    f.inputs "Content" do
      f.input :title
      f.input :description, :input_html => { :rows => 12 }
      f.input :featured
    end
    f.inputs "Inspirations" do
      f.input :bookmarks, :as => :check_boxes
    end
    f.buttons
  end

end
