class AddUpdateFlagToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :update, :boolean, :default => false
  end
end
