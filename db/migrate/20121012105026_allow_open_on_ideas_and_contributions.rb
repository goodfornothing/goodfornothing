class AllowOpenOnIdeasAndContributions < ActiveRecord::Migration
  def up
		add_column :challenges, :open_to_contributions, :boolean, :default => true
  end

  def down
		remove_column :challenges, :open_to_contributions
  end
end
