class ChangeCountToLimit < ActiveRecord::Migration
  def up
    rename_column :slots, :count, :limit
  end

  def down
    rename_column :slots, :limit, :count
  end
end
