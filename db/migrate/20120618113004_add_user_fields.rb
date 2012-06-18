class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :url, :string
    add_column :users, :twitter_handle, :string
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :reasons_for_joining, :text
  end

  def down
    remove_column :users, :url
    remove_column :users, :twitter_handle
    remove_column :users, :location
    remove_column :users, :gender
    remove_column :users, :age
    remove_column :users, :reasons_for_joining
  end
end
