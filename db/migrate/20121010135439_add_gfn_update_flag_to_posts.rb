class AddGfnUpdateFlagToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :update, :gfn_update
  end
end
