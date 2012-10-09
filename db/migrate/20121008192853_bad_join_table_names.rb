class BadJoinTableNames < ActiveRecord::Migration
  def change
    rename_table :trills_challenges, :challenges_trills
  end
end
