class CreateFriendField < ActiveRecord::Migration
  def up
    add_column :friends, :description, :string
  end

  def down
    remove_column :friends, :description
  end
end
