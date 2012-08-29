class RefactorConversation < ActiveRecord::Migration
  def up
    rename_table :conversation_bookmarks, :bookmarks
    rename_table :conversation_categories, :warblings
    rename_table :conversation_posts, :posts
    rename_table :conversation_tags, :tags
  end

  def down
    rename_table :bookmarks, :conversation_bookmarks
    rename_table :warblings, :conversation_categories
    rename_table :posts, :conversation_posts
    rename_table :tags, :conversation_tags
  end
end
