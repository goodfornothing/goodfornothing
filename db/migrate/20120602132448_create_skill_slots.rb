class CreateSkillSlots < ActiveRecord::Migration
  def up
    create_table :slots do |t|
      t.references :skill
      t.references :gig
      t.integer :count
    end
  end

  def down
    drop_table :slots
  end
end
