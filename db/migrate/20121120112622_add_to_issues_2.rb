class AddToIssues2 < ActiveRecord::Migration
  def up
		remove_column :issues, :short_title
  end

  def down
		add_column :issues, :short_title, :string
  end
end
