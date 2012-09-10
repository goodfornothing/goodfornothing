class AddWarblingsUsers < ActiveRecord::Migration
  def up
    create_table :users_warblings do |t|
      t.integer :warbling_id
      t.integer :user_id
    end
  end

  def down
    drop_table :users_warblings
  end
end
