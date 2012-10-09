class DropChallengeTrillAssoc < ActiveRecord::Migration
  def change
    drop_table :challenges_trills
  end
end
