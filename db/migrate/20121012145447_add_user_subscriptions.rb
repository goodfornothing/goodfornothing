class AddUserSubscriptions < ActiveRecord::Migration
  def up
		create_table :challenges_users do |t|
			t.references :user
			t.references :challenge
			t.timestamps
		end
  end

  def down
		drop_table :challenges_users
  end
end
