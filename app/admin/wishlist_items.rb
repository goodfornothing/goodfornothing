ActiveAdmin.register Item do
      
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :label => "Wishlist Items", :priority => 5, :if => proc{ can?(:manage_chapter, Chapter) } 

  config.clear_sidebar_sections!
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
  actions :index, :destroy, :edit, :update, :new, :create

  index :title => 'Wishlist Items' do
        
    content do
       para "Hello World"
     end
    column ("-") { |item|
      if item.complete == true
        "✔"
      else
         "x" 
      end
    }
    column :name
    column ("Cost") { |item| 
      if item.payment_value? 
        number_to_currency(item.payment_value, :unit => "£")
      end
    }    
    column ("Description") { |item| item.description }
    default_actions
  end
  
  form do |f|      
      
      f.inputs "Details" do       
        if current_user.role == "admin"
          f.input :gig, :label => "Which gig?"
        else
          f.input :gig, :label => "Which gig?", :collection => current_user.chapter.gigs.all
        end
        f.input :name
        f.input :description, :input_html => { :rows => 2 }, :label => "Short Description"
        f.input :payment_value, :label => "How much will this cost? (£s)", :placeholder => "0"
      end
      
      f.inputs "Been provided?" do 
        f.input :complete, :as => :radio, :label => "Provided?"
        f.input :provided_by, :label => "Who provided it?"
      end
    f.buttons
  end
  
end
