class CreateCommentsTable < ActiveRecord::Migration
  def up
		create_table :comments do |t|
			t.text :body
			t.integer :commentable_id
			t.string :commentable_type
			t.references :user
			t.timestamps
		end
  end

  def down
		drop_table :comments
  end
end
