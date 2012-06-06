class AddFieldsToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :excerpt, :text
    add_column :blog_posts, :hero_image, :string
  end
end
