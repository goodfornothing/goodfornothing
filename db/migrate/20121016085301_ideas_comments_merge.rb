class IdeasCommentsMerge < ActiveRecord::Migration
  def change
		drop_table :comments
		rename_table :ideas, :comments
		add_column :comments, :commentable_id, :integer
		add_column :comments, :commentable_type, :string
  end
end
