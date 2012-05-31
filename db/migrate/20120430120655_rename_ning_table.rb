class RenameNingTable < ActiveRecord::Migration
  def up
  	rename_table :ning, :nings
  end

  def down
  	rename_table :nings, :ning
  end
end
