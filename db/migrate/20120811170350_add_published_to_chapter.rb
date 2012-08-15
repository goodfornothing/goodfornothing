class AddPublishedToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :published, :boolean, :default => false
    #published_at
  end
end