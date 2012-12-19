ActiveAdmin.register Post do
  
  controller do
    load_resource :except => :index
    authorize_resource
  end
  
  menu :priority => 2, :parent => "Warblings", :if => proc{ can?(:manage, Post) }, :label => "Posts (Long form)"
    
  scope :all, :default => true
  scope :updates, :if => proc { current_user.role == "admin" || current_user.role == "leader" }
  
  filter :title
  
  sidebar :help do
    render "/hive/shared/help"
  end
  
	index do
    column("Title") { |post| link_to post.title, hive_post_path(post) }
    column("Author") { |post| post.user.name unless post.user.nil? }
    column("State") { |post| status_tag((post.published) ? "Published" : "Unpublished") }
    column "" do |post|
      "#{link_to "Edit", edit_hive_post_path(post)} &nbsp; #{link_to "Delete", hive_post_path(post), :method => "delete", :confirm => "Are you sure you wish to delete this post?"}".html_safe
    end
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
		
		unless f.object.new_record?
			f.inputs "Dates" do
				f.input :created_at, :label => "Published at" 
			end
		end
		
    f.inputs "Details" do
      if current_user.role == "admin" || current_user.role == "leader"
        f.input :gfn_update, :label => "Post in Good for Nothing updates?"
      end
			if current_user.role == "admin"
        f.input :chapter
      else
        f.input :chapter, :value => current_user.chapter_id, :input_html => { :disabled => "disabled" }
      end
      f.input :issue, :label => "Add to Warble stream?", :collection => Issue.active
    end
    f.inputs "Post" do   
      f.input :hero_image, :label => "Thumbnail"
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

		f.inputs "State" do
			if f.object.new_record? || f.object.user.nil?
	    	f.input :user_id, :as => :hidden, :value => current_user.id
			end
			f.input :published, :label => "Publish this post?"
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
        row "GFN Update?" do
          (post.gfn_update) ? "Yes" : "No"
        end
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
