class AddSkillToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :skill_id, :integer
  end
end
