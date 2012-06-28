class PostsTags < ActiveRecord::Migration
  def up
    rename_table :tags_posts, :posts_tags
  end

  def down
    rename_table :posts_tags, :tags_posts
  end
end
