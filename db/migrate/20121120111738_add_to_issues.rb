class AddToIssues < ActiveRecord::Migration
  def up
		add_column :issues, :active, :boolean, :default => true
		add_column :issues, :short_title, :string
  end

  def down
		remove_column :issues, :active
		remove_column :issues, :short_title
  end
end
