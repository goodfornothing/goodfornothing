class AddBirdImageToChapters < ActiveRecord::Migration
  def up
    add_column :chapters, :bird_image, :string
  end

  def down
    remove_column :chapters, :bird_image
  end
end
