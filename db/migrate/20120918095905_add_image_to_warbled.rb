class AddImageToWarbled < ActiveRecord::Migration
  def change
    add_column :bookmarks, :hero_image, :string
  end
end
