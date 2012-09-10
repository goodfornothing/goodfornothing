class CreateTalent < ActiveRecord::Migration
  def up
    remove_column :skills_users, :level
    drop_table :skills_users
    create_table :talents do |t|
      t.integer :user_id
      t.integer :skill_id
      t.integer :level, :default => 0
    end
  end

  def down
    create_table :skills_users do |t|
      t.integer :skill_id
      t.integer :user_id
    end
    add_column :skills_users, :level, :integer, :default => 0
    drop_table :talents
  end
end
