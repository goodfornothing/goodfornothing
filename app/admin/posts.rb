ActiveAdmin.register Post do
  
  menu :priority => 2, :parent => "Conversations"
    
  filter :warbling
  filter :chapter
  
	index do
    column :title
    column "Author", :user
    column :created_at
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Details" do
      f.input :chapter
      f.input :user, :label => "Author"
      f.input :warbling
    end
    f.inputs "Post" do   
      f.input :hero_image
      f.input :title
      f.input :excerpt, :input_html => { :rows => 5 }
      f.input :body
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
        row :warbling
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
          simple_format(post.body).html_safe
        end
      end
    end
  end

end
