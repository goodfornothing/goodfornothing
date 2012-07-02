class AddStrikesToBookmarks < ActiveRecord::Migration
  def change
    add_column :conversation_bookmarks, :strikes, :integer, :default => 0
  end
end
