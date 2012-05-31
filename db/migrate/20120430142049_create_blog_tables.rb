class CreateBlogTables < ActiveRecord::Migration
  def up
  	create_table :blog_categories do |t|
      t.string :title
      t.timestamps
    end
  	create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.references :category
      t.timestamps
    end
  end

  def down
  	drop_table :blog_categories
  	drop_table :blog_posts
  end
end
