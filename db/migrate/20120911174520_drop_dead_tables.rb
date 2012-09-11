class DropDeadTables < ActiveRecord::Migration
  def change
    drop_table :expenses
    drop_table :events_users
  end
end
