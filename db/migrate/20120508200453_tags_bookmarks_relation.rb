class TagsBookmarksRelation < ActiveRecord::Migration
  def up
  	create_table :bookmarks_tags do |t|
  		t.integer :tag_id
  		t.integer :bookmark_id
  	end
  	remove_column :library_bookmarks, :library_tag_id
  end

  def down
  	drop_table :bookmarks_tags
  	add_column :library_bookmarks, :library_tag_id, :integer
  end
end
