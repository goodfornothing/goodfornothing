class NewChapterFields < ActiveRecord::Migration
  def up
    add_column :chapters, :city, :string
    add_column :chapters, :country, :string
    add_column :users, :chapter_id, :integer
  end

  def down
    remove_column :chapters, :city
    remove_column :chapters, :country
    remove_column :users, :chapter_id
  end
end
