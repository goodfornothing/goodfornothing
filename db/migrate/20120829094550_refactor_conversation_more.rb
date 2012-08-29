class RefactorConversationMore < ActiveRecord::Migration
  def up
    rename_column :posts, :category_id, :warbling_id
    rename_table :bookmarks_tags, :bookmarks_warblings
    rename_column :bookmarks_warblings, :tag_id, :warbling_id
  end

  def down
    rename_column :posts, :warbling_id, :category_id
    rename_table :bookmarks_warblings, :bookmarks_tags
    rename_column :bookmarks_tags, :warbling_id, :tag_id
  end
end
