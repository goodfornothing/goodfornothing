class AddIconToIssues < ActiveRecord::Migration
  def change
		remove_column :gigs, :poster
		add_column :issues, :icon, :string
  end
end
