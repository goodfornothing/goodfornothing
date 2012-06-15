class ChangeCuratedToPublished < ActiveRecord::Migration
  def up
    rename_column :library_bookmarks, :curated, :published
  end

  def down
    rename_column :library_bookmarks, :published, :curated
  end
end
