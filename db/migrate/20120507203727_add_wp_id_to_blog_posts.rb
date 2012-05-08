class AddWpIdToBlogPosts < ActiveRecord::Migration
  def change
  	add_column :blog_posts, :wordpress_id, :integer
  end
end
