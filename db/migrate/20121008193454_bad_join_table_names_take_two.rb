class BadJoinTableNamesTakeTwo < ActiveRecord::Migration
  def change
    rename_table :trills_issues, :issues_trills
  end
end
