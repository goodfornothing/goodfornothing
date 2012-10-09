class AddUserIdToTrill < ActiveRecord::Migration
  def change
    add_column :trills, :user_id, :integer
  end
end
