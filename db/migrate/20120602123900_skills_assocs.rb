class SkillsAssocs < ActiveRecord::Migration
  def up
    create_table :gigs_skills do |t|
      t.integer :gig_id
      t.integer :skill_id
    end
    
    create_table :skills_users do |t|
      t.integer :skill_id
      t.integer :user_id
    end
  end

  def down
    drop_table :skills_users
    drop_table :gigs_skills
  end
end
