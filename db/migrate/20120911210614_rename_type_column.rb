class RenameTypeColumn < ActiveRecord::Migration
  def up
    rename_column :partners, :type, :purpose
  end

  def down
    rename_column :partners, :purpose, :type
  end
end
