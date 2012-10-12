class DropOldCols < ActiveRecord::Migration
  def up
    remove_column :chapters, :city
  end
end
