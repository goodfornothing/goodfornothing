class ChangeBriefsToChallenges < ActiveRecord::Migration
  def up
    
    rename_table :briefs, :challenges
    remove_column :challenges, :published
    
    remove_column :chapters, :published
    remove_column :friends, :published
    remove_column :skills, :published
    
  end

  def down
    rename_table :challenges, :briefs
    
  end
end
