class RenameBookmarksTableToLibrary < ActiveRecord::Migration
  def up
  	rename_column :bookmarks, :bookmark_tag_id, :library_tag_id
  	rename_table :bookmarks, :library_bookmarks
  	rename_table :bookmark_tags, :library_tags
  end

  def down
  	rename_column :bookmarks, :library_tag_id, :bookmark_tag_id
		rename_table :library_bookmarks, :bookmarks
  	rename_table :library_tags, :bookmark_tags
  end
end
