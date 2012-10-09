ActiveAdmin.register Challenge do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 1, :parent => "Challenges", :if => proc{ can?(:manage, Challenge) } 
  
  filter :gig
  filter :venture
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
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
      row :gig
      row :venture
      row :partner
      row "Issues" do |i|
        i.issues.map{ |w| w.title }.join(', ')
      end
      row "Brief" do
       if challenge.description.is_json?
   		   render_sir_trevor(challenge.description)
   		 else
   		   simple_format(challenge.description).html_safe
   	   end
   	  end
    end
  end
  
  form do |f|
    f.inputs "State" do
      f.input :active
      f.input :open
      f.input :featured
    end
    f.inputs "Details" do
      f.input :title
      f.input :gig
      f.input :venture
      f.input :partner
    end
    f.inputs "Issues" do
      f.input :issues, :as => :check_boxes
    end
    f.inputs "Brief" do
      if challenge.new_record? || challenge.description.is_json?
        f.sir_trevor_text_area :description
      else 
        f.input :description
      end
    end
    f.buttons
  end

end
