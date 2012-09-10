class RemoveDeadTable < ActiveRecord::Migration
  def up
    drop_table :gigs_skills
  end

  def down
    create_table :gigs_skills do |t|
      t.integer :gig_id
      t.integer :skill_id
    end
  end
end
