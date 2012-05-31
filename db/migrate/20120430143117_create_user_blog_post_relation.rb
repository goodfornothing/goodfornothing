class CreateUserBlogPostRelation < ActiveRecord::Migration
  def up
  	add_column :blog_posts, :user_id, :integer
  end

  def down
  	remove_column :blog_posts, :user_id
  end
end
