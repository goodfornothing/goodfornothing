class AskEmailWishList < ActiveRecord::Migration
  def up
    add_column :items, :ask_email, :boolean
  end

  def down
    remove_column :items, :ask_email, :boolean
  end
end
