ActiveAdmin.register Challenge do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 2, :if => proc{ can?(:manage, Challenge) } 
  
  filter :gig
  filter :venture
  
  sidebar "Ideas, contributions", :only => :show do
    span "To manage this challenge's user generated content #{link_to "head on over", challenge_path(challenge)} on the main site.".html_safe
  end
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  index do
    column("Title") { |challenge| link_to challenge.title, hive_challenge_path(challenge) }
    column(:venture) { |challenge| challenge.venture.name if challenge.venture.present? }
    column "" do |challenge|
      "#{link_to "Edit", edit_hive_challenge_path(challenge)} &nbsp; #{link_to "Delete", hive_challenge_path(challenge), :method => "delete", :confirm => "Are you sure you wish to delete this challenge?"}".html_safe
    end
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
