class UserActiveByDefault < ActiveRecord::Migration
  def up
    change_column :users, :activated, :boolean, :default => true
  end

  def down
    change_column :users, :activated, :boolean, :default => false
  end
end
