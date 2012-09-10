class AddLevelToUsersSkills < ActiveRecord::Migration
  def change
    add_column :skills_users, :level, :integer, :default => 0
  end
end
