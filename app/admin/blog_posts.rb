ActiveAdmin.register Blog::Post do
  
  menu :parent => "Blog", :priority => 1
  
	index do
    column :title
    column :category
    column :chapter
    column "Author", :user
    default_actions
  end
  
  form :html => { :enctype => "multipart/form-data" }  do |f|
    f.inputs "Content" do
      f.input :category
      f.input :chapter
      f.input :user, :label => "Author"
      f.input :hero_image
      f.input :title
      f.input :excerpt, :input_html => { :rows => 5 }
      f.input :body
    end
    f.buttons
  end
  
  show  do |post|
    panel 'Meta' do
      attributes_table_for post do
        row :chapter
        row :user
        row :created_at
        row :category
      end  
    end
    panel 'Post' do
      attributes_table_for post do
        row :title
        row :excerpt
        row :hero_image do
          image_tag(post.hero_image.url) unless post.hero_image.url.nil?
        end
        row :body do
          simple_format(post.body).html_safe
        end
      end
    end
  end

end
