class ChangeBlogCategoryRelation < ActiveRecord::Migration
  def up
  	rename_column :blog_posts, :blog_category_id, :category_id
  end

  def down
  	rename_column :blog_posts, :category_id, :blog_category_id
  end
end
