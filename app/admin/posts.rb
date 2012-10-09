ActiveAdmin.register Post do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 1, :parent => "Warblings", :if => proc{ can?(:manage, Post) } 
    
  scope :all, :default => true
  scope :good_for_nothing_updates do
    Post.updates
  end
  
  filter :issue
  
  sidebar "The Hive" do
    render "/admin/shared/help"
  end
  
	index do
    column :title
    column "Author", :user
    column :created_at
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Details" do
      if current_user.role == "admin"
        f.input :chapter
      else
        f.input :chapter, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :issue
      f.input :user_id, :as => :hidden, :value => current_user.id
    end
    f.inputs "Post" do   
      f.input :hero_image
      f.input :title
      f.input :excerpt, :input_html => { :rows => 5 }
    end
    f.inputs "Body" do
      if post.new_record? || post.body.is_json?
        f.sir_trevor_text_area :body
      else 
        f.input :body
      end
    end
    f.buttons
  end
  
  show  do |post|
    panel 'Details' do
      attributes_table_for post do
        row :chapter
        row "Author" do 
          post.user.name if post.user
        end
        row "Posted" do
          post.created_at
        end
        row :issue
      end  
    end
    panel 'Post' do
      attributes_table_for post do
        row :title
        row :excerpt
        row :hero_image do
          image_tag(post.hero_image.thumbnail) unless post.hero_image.url.nil?
        end
        row :body do
         if post.body.is_json?
     		   render_sir_trevor(post.body)
     		 else
     		   simple_format(post.body).html_safe
     	   end
     	  end
      end
    end
  end

end
