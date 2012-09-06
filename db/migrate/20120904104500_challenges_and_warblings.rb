class ChallengesAndWarblings < ActiveRecord::Migration
  def up
    create_table :challenges_warblings do |t|
      t.integer :challenge_id
      t.integer :warbling_id
    end
  end

  def down
    drop_table :challenges_warblings
  end
end
