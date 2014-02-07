class AddChapterDescription < ActiveRecord::Migration
  def up
    add_column :chapters, :chapter_description, :string
  end

  def down
    remove_column :chapters, :chapter_description, :string    
  end
end
