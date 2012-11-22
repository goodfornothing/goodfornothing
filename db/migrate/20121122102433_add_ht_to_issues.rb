class AddHtToIssues < ActiveRecord::Migration
  def change
		add_column :issues, :hashtag, :string
  end
end
