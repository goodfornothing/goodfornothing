class CreateBookmarksTable < ActiveRecord::Migration
  def up
  	create_table :bookmark_tags do |t|
      t.string :title
      t.timestamps
    end
  	create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.text :url
      t.references :bookmark_tags
      t.boolean :curated, :default => false
      t.timestamps
    end
  end

  def down
  	drop_table :bookmark_tags
  	drop_table :bookmarks
  end
end
