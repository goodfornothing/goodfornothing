class AddTagsAgain < ActiveRecord::Migration
  def up
    drop_table :posts_tags
    create_table :bookmarks_tags do |t|
      t.integer :bookmark_id
      t.integer :tag_id
    end
  end

  def down
    drop_table :bookmarks_tags
  end
end
