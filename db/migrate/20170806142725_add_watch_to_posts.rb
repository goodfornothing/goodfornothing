class AddWatchToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :link, :string
    add_column :posts, :watch, :boolean
  end
end
