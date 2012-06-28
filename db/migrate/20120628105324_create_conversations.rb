class CreateConversations < ActiveRecord::Migration
  def up
    rename_table :blog_posts, :conversation_posts
    rename_table :library_bookmarks, :conversation_bookmarks
    create_table :tags_posts do |t|
      t.integer :tag_id
      t.integer :post_id
    end
  end

  def down
    rename_table :conversation_posts, :blog_posts
    rename_table :conversation_bookmarks, :library_bookmarks
    drop_table :tags_posts
  end
end
