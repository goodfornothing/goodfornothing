class RenameNingTableAgain < ActiveRecord::Migration
  def up
  	rename_table :nings, :ning_profiles
  end

  def down
  	rename_table :ning_profiles, :nings
  end
end
