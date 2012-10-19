ActiveAdmin.register Skill do
  
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
    column :title
    column ("Definition") { |skill| skill.description }
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description, :input_html => { :rows => 5 }, :label => "Definition"
      f.input :lower, :label => "Lower", :hint => "This value will be displayed on the lower end of talent sliders"
      f.input :upper, :label => "Upper", :hint => "This value will be displayed on the upper end of talent sliders"
    end
    f.buttons
  end
  
end
