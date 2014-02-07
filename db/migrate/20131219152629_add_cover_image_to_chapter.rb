class AddCoverImageToChapter < ActiveRecord::Migration
  def self.up
    add_column :chapters, :cover_image, :string
  end
  
  def self.down
    remove_column :chapters, :cover_image
  end
end
