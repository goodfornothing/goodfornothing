class AddChapterTitleAndVideo < ActiveRecord::Migration
  def up
    add_column :chapters, :chapter_title, :string
    add_column :chapters, :chapter_video_embed, :string    
  end

  def down
    remove_column :chapters, :chapter_title, :string    
    remove_column :chapters, :chapter_video_embed, :string        
  end
end
