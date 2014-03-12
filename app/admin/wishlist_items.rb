ActiveAdmin.register Item do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 10, :parent => "Meta", :if => proc{ can?(:manage, Skill) } 

  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  actions :index, :destroy, :edit, :update, :new, :create

  index do 
    column :name
    column ("Short Description") { |item| item.description }
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
			if current_user.role == "admin"
        f.input :gig
      else
#        f.input :gig, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :name
      f.input :description, :input_html => { :rows => 2 }, :label => "Short Description"
      f.input :payment_value, :label => "How much will this cost? (£s)", :placeholder => "0"
      f.input :complete, :as => :radio, :label => "Provided?"
      f.input :provided_by, :label => "Group / member that provided the item"
    end
    f.buttons
  end
  
end
