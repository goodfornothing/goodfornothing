class UserActiveByDefault < ActiveRecord::Migration
  def up
    drop_table :locations
    change_column :users, :activated, :boolean, :default => true
  end

  def down
    change_column :users, :activated, :boolean, :default => false
  end
end
